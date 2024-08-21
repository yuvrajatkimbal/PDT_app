// Create a list of card data
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/infocards.model.dart';

final List<CardData> cardsData = [
  CardData(
      title: 'Estimated Production',
      value: '38000 u/day',
      color: const Color.fromARGB(255, 13, 88, 134),
      icon: FontAwesomeIcons.cubes,
      iconBgColor: const Color.fromARGB(255, 20, 133, 203)),
  CardData(
      title: 'Active Lines',
      value: '15/15',
      color: const Color.fromARGB(255, 38, 120, 64),
      icon: FontAwesomeIcons.squareCheck,
      iconBgColor: const Color.fromARGB(255, 59, 165, 92)),
  CardData(
    title: 'Average Downtime',
    value: '38 mints',
    color: const Color.fromARGB(255, 161, 49, 41),
    icon: FontAwesomeIcons.clock,
    iconBgColor: Colors.red,
  ),
  CardData(
      title: 'Production rate',
      value: '250 u/hr',
      color: const Color.fromARGB(255, 182, 111, 5),
      icon: FontAwesomeIcons.chartArea,
      iconBgColor: Colors.orange),
];
