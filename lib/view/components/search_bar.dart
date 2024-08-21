import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;
  const CustomSearchBar({super.key, required this.controller});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: 'Search by Line Id or Category',
          prefixIcon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(
              FontAwesomeIcons.searchengin,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(),
          suffixIcon: GestureDetector(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FaIcon(FontAwesomeIcons.filter),
            ),
          )),
    );
  }
}
