import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthButtons extends StatefulWidget {
  const AuthButtons({super.key});

  @override
  State<AuthButtons> createState() => _AuthButtonsState();
}

class _AuthButtonsState extends State<AuthButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        // Text(
                        //   'Sign Up',
                        //   style: TextStyle(fontSize: 18, color: Colors.white),
                        // ),
                        FaIcon(
                          FontAwesomeIcons.solidUser,
                          color: Colors.white,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: VerticalDivider(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      // Text(
                      //   'Sign Up',
                      //   style: TextStyle(fontSize: 18, color: Colors.white),
                      // ),
                      FaIcon(
                        FontAwesomeIcons.userPlus,
                        color: Colors.white,
                        size: 22,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}