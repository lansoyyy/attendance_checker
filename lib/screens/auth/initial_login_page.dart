import 'package:attendance_checker/screens/auth/landing_page.dart';
import 'package:attendance_checker/screens/auth/login_page.dart';
import 'package:attendance_checker/screens/auth/signup_one_page.dart';
import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/header_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class InitialLoginPage extends StatelessWidget {
  const InitialLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeaderWidget(),
              const SizedBox(
                height: 50,
              ),
              TextWidget(
                text: 'Sign in\nas',
                fontSize: 48,
                fontFamily: 'Bold',
                color: primary,
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonWidget(
                color: primary,
                radius: 100,
                fontSize: 28,
                label: 'Student',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: 'or',
                fontSize: 28,
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
                label: 'Professor',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
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
