import 'package:attendance_checker/screens/auth/initial_login_page.dart';
import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/header_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class SignupTwoPage extends StatefulWidget {
  const SignupTwoPage({super.key});

  @override
  State<SignupTwoPage> createState() => _SignupTwoPageState();
}

class _SignupTwoPageState extends State<SignupTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeaderWidget(),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'STUDENT',
                fontSize: 38,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 50,
              ),
              TextWidget(
                text: 'Place your finger on Scanner',
                fontSize: 18,
                fontFamily: 'Medium',
                color: primary,
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/biometrics.png',
                width: 150,
              ),
              const SizedBox(
                height: 125,
              ),
              TextWidget(
                text: 'You may now proceed',
                fontSize: 18,
                fontFamily: 'Medium',
                color: primary,
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonWidget(
                color: primary,
                radius: 100,
                fontSize: 24,
                label: 'Login',
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const InitialLoginPage()),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
