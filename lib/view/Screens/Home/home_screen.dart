import 'package:downtime_frontend/data/infocard_data.dart';
import 'package:downtime_frontend/view/components/auth_buttons.dart';
import 'package:downtime_frontend/view/components/info_cards.dart';
import 'package:downtime_frontend/view/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
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
                      ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 40, 51, 59)),
                                  BoxShadow(
                                      color: Color.fromARGB(255, 137, 137, 137))
                                ],
                                color: Color.fromARGB(255, 221, 240, 255),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 55,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      'Line ${index + 1}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),Text('')
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  const Column(
                    children: [],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
