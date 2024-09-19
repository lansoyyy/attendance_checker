import 'package:attendance_checker/screens/auth/initial_login_page.dart';
import 'package:attendance_checker/screens/auth/landing_page.dart';
import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class InitialLandingPage extends StatelessWidget {
  const InitialLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              TextWidget(
                text: 'Welcome\nto',
                fontSize: 42,
                fontFamily: 'Bold',
                color: primary,
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/EATS.png',
                width: 300,
              ),
              const SizedBox(
                height: 125,
              ),
              ButtonWidget(
                color: Colors.white,
                textColor: primary,
                radius: 100,
                fontSize: 24,
                label: 'Sign In',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const InitialLoginPage()),
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: 'or',
                fontSize: 18,
                fontFamily: 'Bold',
                color: primary,
              ),
              const SizedBox(
                height: 5,
              ),
              ButtonWidget(
                color: primary,
                radius: 100,
                fontSize: 24,
                label: 'Sign Up',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const LandingPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
