import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthButtons extends StatefulWidget {
  const AuthButtons({super.key});

  @override
  State<AuthButtons> createState() => _AuthButtonsState();
}

class _AuthButtonsState extends State<AuthButtons> {
  final _loginFormKey = GlobalKey<FormState>();
  final _signupFormKey = GlobalKey<FormState>();

  String? _selectedDepartment;
  final List<String> _departments = ['Sales', 'Engineering', 'HR', 'Marketing'];

  void _showLoginDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 20, 133, 203),
                ),
              ),
            ],
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width > 800
                ? MediaQuery.of(context).size.width * 0.18
                : MediaQuery.of(context).size.width * 0.8,
            child: Form(
              key: _loginFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 20, 133, 203),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_loginFormKey.currentState!.validate()) {
                  // Handle login logic here
                  Navigator.of(context).pop();
                }
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 20, 133, 203),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSignupDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 20, 133, 203),
              fontSize: 22,
              fontWeight: FontWeight.w500),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign Up'),
            ],
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width > 800
                ? MediaQuery.of(context).size.width * 0.18
                : MediaQuery.of(context).size.width * 0.8,
            child: Form(
              key: _signupFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Department',
                      border: OutlineInputBorder(),
                    ),
                    value: _selectedDepartment,
                    items: _departments.map((String department) {
                      return DropdownMenuItem<String>(
                        value: department,
                        child: Text(department),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDepartment = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your department';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 20, 133, 203),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_signupFormKey.currentState!.validate()) {
                  // Handle signup logic here
                  Navigator.of(context).pop();
                }
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 20, 133, 203),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

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
        child: Row(
          children: [
            GestureDetector(
              onTap: _showLoginDialog,
              child: const Padding(
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
            ),
            const SizedBox(
              height: 20,
              child: VerticalDivider(
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: _showSignupDialog,
              child: const Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
