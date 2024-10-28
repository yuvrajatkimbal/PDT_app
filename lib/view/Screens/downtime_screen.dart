import 'package:flutter/material.dart';

import '../../data/lines_status_data.dart';

class DowntimeRecordsScreen extends StatelessWidget {
  final String lineId;

  const DowntimeRecordsScreen({super.key, required this.lineId});

  @override
  Widget build(BuildContext context) {
    // Assuming linesStatusData is available globally or passed to this screen.
    final lineData = linesStatusData.firstWhere((line) => line.lineId == lineId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Downtime Records for Line $lineId'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Line ID: ${lineData.lineId}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Category: ${lineData.lineCategory}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Downtime Records:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: lineData.downtimeRecord.length,
                itemBuilder: (context, index) {
                  final record = lineData.downtimeRecord[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status: ${record.status}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: record.status == "Stop"
                                  ? Colors.red
                                  : record.status == "Pause"
                                      ? Colors.yellow
                                      : Colors.green,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text('Reason: ${record.reason }'),
                          const SizedBox(height: 4),
                          Text('Duration: ${record.duration} minutes'),
                          const SizedBox(height: 4),
                          Text('Last Updated: ${record.lastUpdated}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
