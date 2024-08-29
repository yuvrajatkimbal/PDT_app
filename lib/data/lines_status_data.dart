import '../model/lines_status.model.dart';

List<LinesStatus> linesStatusData = [
  LinesStatus(
    lineId: 'Line 1',
    lastUpdated: "22/08/2024 00:16",
    status: "Processing",
    lineCategory: "Production",
    reason: "",
    downtimeRecord: [
      DowntimeRecord(
        status: "Pause",
        reason: "Maintenance",
        duration: 30, // in minutes
        lastUpdated: "22/08/2024 01:00",
      ),
      DowntimeRecord(
        status: "Stop",
        reason: "Break",
        duration: 15, // in minutes
        lastUpdated: "22/08/2024 01:30",
      ),
    ],
  ),
  LinesStatus(
    lineId: 'Line 2',
    lastUpdated: "22/08/2024 00:16",
    status: "Pause",
    lineCategory: "Production",
    reason: "Break",
    downtimeRecord: [
      DowntimeRecord(
        status: "Pause",
        reason: "Scheduled",
        duration: 45, // in minutes
        lastUpdated: "22/08/2024 02:00",
      ),
    ],
  ),
  LinesStatus(
    lineId: 'Line 3',
    lastUpdated: "22/08/2024 00:16",
    status: "Processing",
    lineCategory: "Production",
    reason: "",
    downtimeRecord: [],
  ),
  LinesStatus(
    lineId: 'Line 4',
    lastUpdated: "22/08/2024 00:16",
    status: "Processing",
    lineCategory: "Production",
    reason: "",
    downtimeRecord: [
      DowntimeRecord(
        status: "Stop",
        reason: "Emergency",
        duration: 60, // in minutes
        lastUpdated: "22/08/2024 03:00",
      ),
    ],
  ),
  LinesStatus(
    lineId: 'Line 5',
    lastUpdated: "22/08/2024 00:16",
    status: "Processing",
    lineCategory: "Production",
    reason: "",
    downtimeRecord: [],
  ),
  LinesStatus(
    lineId: 'Line 6',
    lastUpdated: "22/08/2024 00:16",
    status: "Stop",
    lineCategory: "Production",
    reason: "Mechanical Issue",
    downtimeRecord: [
      DowntimeRecord(
        status: "Stop",
        reason: "Mechanical Failure",
        duration: 120, // in minutes
        lastUpdated: "22/08/2024 04:00",
      ),
    ],
  ),
  LinesStatus(
    lineId: 'Line 7',
    lastUpdated: "22/08/2024 00:16",
    status: "Processing",
    lineCategory: "Production",
    reason: "",
    downtimeRecord: [
      DowntimeRecord(
        status: "Pause",
        reason: "Calibration",
        duration: 25, // in minutes
        lastUpdated: "22/08/2024 05:00",
      ),
    ],
  ),
];

class DowntimeRecord {
  final String status;
  final String reason;
  final int duration; // in minutes
  final String lastUpdated;

  DowntimeRecord({
    required this.status,
    required this.reason,
    required this.duration,
    required this.lastUpdated,
  });
}
