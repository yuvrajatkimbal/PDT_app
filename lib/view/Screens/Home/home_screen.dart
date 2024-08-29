import 'package:downtime_frontend/data/infocard_data.dart';
import 'package:downtime_frontend/view/components/auth_buttons.dart';
import 'package:downtime_frontend/view/components/downtime_reason_chart.dart';
import 'package:downtime_frontend/view/components/info_cards.dart';
import 'package:downtime_frontend/view/components/line_status_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/chart_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 133, 203),
        title: SvgPicture.network(
          'https://ipfs.filebase.io/ipfs/QmbMbv2WXqGhuxM42hMhgCoe2Qvue7Rabe7yEAvQm4DYrt',
          height: screenHeight * 0.075,
          // width: screenWidth * 0.03,
          // color: Colors.black,
        ),
        actions: const [AuthButtons()],
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Production Stats',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.center,
                child: InfoCards(
                  cardsData: cardsData,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Wrap(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LineStatusCards(),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Reason-Wise Stats',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      DowntimeReasonChart(),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              const ChartView(),
            ],
          ),
        ),
      ),
    );
  }
}
