import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../model/infocards.model.dart';

class InfoCards extends StatelessWidget {
  final List<CardData> cardsData;

  const InfoCards({super.key, required this.cardsData});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Wrap(
          spacing: screenWidth * 0.04, // Space between cards
          runSpacing: screenHeight * 0.04, // Space between rows
          alignment: WrapAlignment.center,
          children: cardsData.map((data) {
            return Stack(clipBehavior: Clip.none, children: [
              Container(
                alignment: Alignment.center,
                height: screenHeight * 0.2,
                width:
                    min(screenWidth * 0.6, 250), // Max width for larger screens
                padding: EdgeInsets.all(
                  screenWidth * 0.015,
                ), // Dynamic padding
                decoration: BoxDecoration(
                  color: data.color,
                  borderRadius: BorderRadius.circular(
                    screenWidth * 0.025,
                  ), // Responsive radius
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center the content
                  children: [
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: min(
                          screenHeight * 0.03,
                          screenWidth * 0.05,
                        ),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ), // Responsive spacing
                    Text(
                      data.value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: min(screenHeight * 0.02, screenWidth * 0.04),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -screenHeight * 0.022,
                left: -screenWidth * 0.022,
                child: CircleAvatar(
                  radius: screenHeight * 0.04,
                  backgroundColor: data.iconBgColor,
                  child: FaIcon(
                    data.icon,
                    color: Colors.white,
                    size: screenHeight * 0.04,
                  ),
                ),
              ),
            ]);
          }).toList(),
        );
      },
    );
  }
}
