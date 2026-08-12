/**
 * Chat push notifications for the dawri app.
 *
 * Deploy with:
 *   cd functions && npm install
 *   firebase deploy --only functions
 *
 * Why a Cloud Function rather than the app or the backend: only the server can
 * send to a device the sender has no knowledge of, and the backend never sees
 * chat messages at all (they go straight from client to Firestore).
 */
const { onDocumentCreated } = require("firebase-functions/v2/firestore");
const { initializeApp } = require("firebase-admin/app");
const { getFirestore, FieldValue } = require("firebase-admin/firestore");
const { getMessaging } = require("firebase-admin/messaging");

initializeApp();

const db = getFirestore();

/** Must match `RemoteMessageTypes.chatMessage` in notifications_service.dart. */
const TYPE_CHAT_MESSAGE = "100";

/** Mirrors ChatMessageModel.previewText(). Chat is text-only. */
function previewOf(message) {
  return message.text || "";
}

exports.onChatMessageCreated = onDocumentCreated(
  "chats/{chatId}/messages/{messageId}",
  async (event) => {
    const message = event.data && event.data.data();
    if (!message) return;

    const { chatId } = event.params;
    const senderId = message.senderId;
    if (!senderId) return;

    const chatSnap = await db.collection("chats").doc(chatId).get();
    if (!chatSnap.exists) return;

    const chat = chatSnap.data();
    const members = chat.members || [];
    const recipientId = members.find((id) => id !== senderId);
    if (!recipientId) return;

    const recipientSnap = await db.collection("users").doc(recipientId).get();
    const tokens = (recipientSnap.exists && recipientSnap.data().fcmTokens) || [];
    if (tokens.length === 0) return;

    // The sender's display name comes from the chat's denormalized copy, which
    // the app keeps in step with the backend profile.
    const senderInfo = (chat.memberInfo && chat.memberInfo[senderId]) || {};
    const senderName = senderInfo.name || "";

    const response = await getMessaging().sendEachForMulticast({
      tokens,
      notification: {
        title: senderName,
        body: previewOf(message),
      },
      // NotificationService reads these data keys; `recordId` is the sender's id
      // so tapping the push can open the right conversation.
      data: {
        id: "",
        type: TYPE_CHAT_MESSAGE,
        recordId: senderId,
        image: senderInfo.avatar || "",
        body: previewOf(message),
      },
      android: {
        priority: "high",
        notification: { channelId: "academies-global-channel" },
      },
      apns: {
        payload: { aps: { category: "academies_categoryIdentifier", sound: "default" } },
      },
    });

    // Uninstalled or reinstalled devices leave dead tokens behind; pruning them
    // keeps the array from growing without bound and skews of failure counts.
    const stale = [];
    response.responses.forEach((result, index) => {
      const code = result.error && result.error.code;
      if (
        code === "messaging/registration-token-not-registered" ||
        code === "messaging/invalid-registration-token"
      ) {
        stale.push(tokens[index]);
      }
    });

    if (stale.length > 0) {
      await recipientSnap.ref.update({
        fcmTokens: FieldValue.arrayRemove(...stale),
      });
    }
  }
);
