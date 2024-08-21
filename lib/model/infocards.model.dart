import 'package:flutter/material.dart';

class CardData {
  final String title;
  final String value;
  final Color color;
  final IconData icon;
  final Color iconBgColor;


  CardData({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
    required this.iconBgColor
  });
}