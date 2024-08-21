class LinesStatus {
  final String lineId;
  final String lineCategory;
  final String status;
  final String lastUpdated;
  String? reason="unassigned";

  LinesStatus({
    required this.lineId,
    required this.lastUpdated,
    required this.status,
    required this.lineCategory,
    this.reason
  });
}
