# Help Center API — Backend Spec

Endpoints required by the **Help Center (مركز المساعدة)** screen in the `dawri` mobile app.

- **Base host:** `https://api-dawry.sanam-ksa.com/`
- **Auth:** `Authorization: Bearer <token>`
- **Headers:** `Accept: application/json`, plus the app's locale header

## Status: what exists vs. what's needed

| Endpoint | Status | Used for |
|---|---|---|
| `GET api/app/support-data` | ✅ **already exists** — no change needed | Contact channels (phone, WhatsApp, socials) |
| `GET api/app/faq-categories` | ❌ **NEW — please build** | The 4-card category grid |
| `GET api/app/faqs` | ❌ **NEW — please build** | The FAQ accordion |

The client is already implemented against the contract below. **The screen ships and works today**
without the two new endpoints: when they 404 or fail, the app falls back to 4 FAQs and 4 categories
bundled in the app's translation files and shows an "offline" notice. Building the endpoints replaces
that bundled copy with content your team can edit without an app release.

## Response envelope (mandatory)

The app's `NetworkService` treats **any** response without `status: true` as an error and surfaces
`result.message` or `message` to the user:

```json
{ "status": true, "message": "", "data": { } }
```

Failures must be `{ "status": false, "message": "localized, user-facing" }`. HTTP 200 with
`status: false` is fine — the client keys off `status`, not the HTTP code.

**Localization:** `title`, `subtitle`, `question`, and `answer` must come back already translated in
the caller's locale (per the locale header). The client does no translation of API content.

---

## 1. FAQ categories — NEW

```
GET api/app/faq-categories
```

No parameters.

**200 — success**

```json
{
  "status": true,
  "message": "",
  "data": {
    "categories": [
      {
        "id": 1,
        "slug": "bookings",
        "title": "إدارة الحجوزات",
        "subtitle": "تعديل، إلغاء، استرداد",
        "faqs_count": 6
      },
      {
        "id": 2,
        "slug": "wallet",
        "title": "المحفظة ورسوم المباراة",
        "subtitle": "شحن، تحويل، دفع",
        "faqs_count": 4
      }
    ]
  }
}
```

| Field | Type | Required | Notes |
|---|---|---|---|
| `id` | int | yes | Used as the filter key against `faqs.category_id` |
| `slug` | string | yes | **Picks the icon** — see the fixed list below |
| `title` | string | yes | Card title, localized |
| `subtitle` | string | no | Card subtitle, localized |
| `faqs_count` | int | no | Not displayed yet; send it if cheap |

### `slug` values the client has icons for

`bookings` · `wallet` (or `payments`) · `tournaments` (or `championships`) · `account` (or `profile`)
· `challenges` · `teams`

Any other slug renders a generic question-mark icon — **it won't break**, but tell us if you add a
category and we'll add the glyph. Please keep slugs stable and lowercase; they're a machine name, not
display text.

**Errors:** `401` unauthenticated. An empty list is `"categories": []` with `status: true` — not an error.

---

## 2. FAQs — NEW

```
GET api/app/faqs?category_id={id}
```

| Param | Type | Required | Notes |
|---|---|---|---|
| `category_id` | int | no | Omitted means **all** FAQs. The app currently always omits it and filters client-side — see the note below. |

**200 — success**

```json
{
  "status": true,
  "message": "",
  "data": {
    "faqs": [
      {
        "id": 11,
        "category_id": 1,
        "question": "كيف ألغي حجز ملعب وأستعيد مبلغي؟",
        "answer": "يمكنك الإلغاء واستعادة كامل المبلغ إلى محفظتك إذا تم الإلغاء قبل 24 ساعة على الأقل من موعد الحجز."
      }
    ]
  }
}
```

| Field | Type | Required | Notes |
|---|---|---|---|
| `id` | int | yes | Must be unique and stable — drives accordion open/close state |
| `category_id` | int | yes | Must match an id from `/faq-categories`, otherwise the FAQ is unreachable via the grid |
| `question` | string | yes | Localized |
| `answer` | string | yes | Localized. **Plain text only** — the client renders it as a plain `Text`, so HTML/Markdown will show as raw characters. Tell us if you need rich text and we'll add a renderer. |

**Please return all FAQs in one call** (expect tens, not thousands). The app fetches the full list
once and does category filtering *and* free-text search locally, so search works instantly and
offline. The `category_id` query param is specified so you have the option server-side, but the app
won't use it unless the list grows large enough to need paging — if you expect hundreds of FAQs,
tell us and we'll switch to per-category fetching.

**Search:** handled entirely client-side, matching the query against both `question` and `answer`.
No search endpoint needed.

**Errors:** `401` unauthenticated. An empty list is `"faqs": []` with `status: true` — the client
then falls back to the bundled copy.

---

## 3. Support contact data — ALREADY EXISTS, one request

```
GET api/app/support-data
```

Already implemented and consumed at splash; the Help Center now reuses it. Current shape:

```json
{
  "status": true,
  "data": {
    "phone": "+966500000000",
    "whatsapp_link": "https://wa.me/966500000000",
    "twitter_link": "https://x.com/dawri",
    "instagram_link": "https://instagram.com/dawri",
    "snapchat_link": null,
    "tiktok_link": null
  }
}
```

How the client uses it:

- `phone` → **"اتصل بنا"** button (`tel:` dial). Button is hidden when null/empty.
- `whatsapp_link` → **"واتساب"** button. Accepts either a full `https://wa.me/...` URL **or** a bare
  phone number (the client builds the `wa.me` URL itself). A full URL is preferred.
- Social links → a row of icons under the contact buttons; each icon appears only when its link is
  non-empty. Must be full `https://` URLs.

If **both** `phone` and `whatsapp_link` are null the contact section shows only a retry link, so
please always populate at least one.

### The one ask on this endpoint

> **There is no live-chat or support-ticket channel in `support-data`.**

The design had a **"دردشة مباشرة" (Live Chat)** button, but nothing in the API backs it, so it has
been replaced with the "اتصل بنا" call button for now. The `helpContactChat` translation key is kept
in the app for when a channel exists. If live chat / support tickets are on the roadmap, we'd need
either:

1. **A chat link** — simplest: add a `support_chat_link` field to `support-data` (Intercom / Crisp /
   Tawk web URL) and the app opens it in a webview. **No new endpoints required.**
2. **Or a ticket system** — `POST api/app/support-tickets` (`subject`, `message`, optional
   `category_id`, attachments) + `GET api/app/support-tickets` to list the user's tickets with
   statuses and replies. This is a larger piece of work; tell us if you want it specced properly.

Option 1 is a one-field change and would light the button up immediately — that's our recommendation.

---

## Client-side summary

| UI element | Source |
|---|---|
| Category grid (tap to filter, tap again to clear) | `GET api/app/faq-categories` |
| FAQ accordion | `GET api/app/faqs` |
| Search box | local, over question + answer |
| "اتصل بنا" button | `support-data.phone` |
| "واتساب" button | `support-data.whatsapp_link` |
| Social icon row | `support-data.*_link` |
| Pull-to-refresh | re-runs all three calls |

Offline / API-failure behaviour: bundled 4 FAQs + 4 categories with an amber "showing saved
questions" notice. Nothing 500s the screen.
