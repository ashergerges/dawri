class TimeLineModel {
  final String title;
  final String price;
  final String? hint;
  final DateTime dateTime;
  final bool isCompleted;

  TimeLineModel({
    required this.title,
    required this.price,
    this.hint,
    required this.dateTime,
    required this.isCompleted,
  });
}
