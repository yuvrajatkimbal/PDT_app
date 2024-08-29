import 'package:downtime_frontend/view/Screens/downtime_screen.dart';
import 'package:downtime_frontend/view/components/search_bar.dart';
import 'package:flutter/material.dart';

import '../../data/lines_status_data.dart';

class LineStatusCards extends StatefulWidget {
  const LineStatusCards({super.key});

  @override
  State<LineStatusCards> createState() => _LineStatusCardsState();
}

class _LineStatusCardsState extends State<LineStatusCards> {
  TextEditingController controller = TextEditingController();
  final List<bool> _isExpanded = List.filled(7, false);

  @override
  Widget build(BuildContext context) {
    double screenWidth;
    if (MediaQuery.of(context).size.width <= 800) {
      screenWidth = MediaQuery.of(context).size.width;
    } else {
      screenWidth = MediaQuery.of(context).size.width / 2;
    }

    return SizedBox(
      width: screenWidth,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Line Status',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomSearchBar(
            controller: controller,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(161, 0, 0, 0),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Line Id'),
                      Text('Category                  '),
                      Text('Status'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 280,
                  child: ListView.builder(
                    itemCount: 7,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            boxShadow: [
                              BoxShadow(color: Color.fromARGB(255, 40, 51, 59)),
                              BoxShadow(
                                  color: Color.fromARGB(255, 137, 137, 137))
                            ],
                            color: Color.fromARGB(255, 221, 240, 255),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 35,
                                    width: 55,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: linesStatusData[index].status ==
                                              "Stop"
                                          ? Colors.red
                                          : linesStatusData[index].status ==
                                                  "Pause"
                                              ? Colors.yellow
                                              : Colors.green,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      linesStatusData[index].lineId,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    linesStatusData[index].lineCategory,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(143, 0, 0, 0),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        width: 80,
                                        child: Text(
                                          linesStatusData[index].status,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(143, 0, 0, 0),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          _isExpanded[index]
                                              ? Icons.expand_less
                                              : Icons.expand_more,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isExpanded[index] =
                                                !_isExpanded[index];
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if (_isExpanded[index])
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Divider(
                                        thickness: 0.4,
                                        color: Color.fromARGB(40, 0, 0, 0),
                                      ),
                                      linesStatusData[index].reason != null &&
                                              linesStatusData[index]
                                                  .reason!
                                                  .isNotEmpty
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Issue Owner: ${linesStatusData[index].issueOwner ?? 'Unassigned'}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        143, 0, 0, 0),
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  "Reason: ${linesStatusData[index].reason ?? 'Unassigned'}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        143, 0, 0, 0),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const SizedBox(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Last Updated: ${linesStatusData[index].lastUpdated}",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Color.fromARGB(143, 0, 0, 0),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return DowntimeRecordsScreen(
                                                        lineId: linesStatusData[
                                                                index]
                                                            .lineId);
                                                  },
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'Downtime History',
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
        ],
      ),
    );
  }
}
