class NotificationItem {
  final String title;
  final String? time; // nullable — yesterday items have no time shown

  const NotificationItem({
    required this.title,
    this.time,
  });
}
