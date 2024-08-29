import 'package:downtime_frontend/data/lines_status_data.dart';

class LinesStatus {
  final String lineId;
  final String lineCategory;
  final String status;
  final String lastUpdated;
  String? reason = "unassigned";
  String? issueOwner;
  final List<DowntimeRecord> downtimeRecord;

  LinesStatus({
    required this.lineId,
    required this.lastUpdated,
    required this.status,
    required this.lineCategory,
    this.reason,
    this.issueOwner,
    required this.downtimeRecord
  });
}
