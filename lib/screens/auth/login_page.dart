import 'package:attendance_checker/screens/auth/after_login_page.dart';
import 'package:attendance_checker/screens/auth/signup_two_page.dart';
import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/header_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final studentId = TextEditingController();
  final password = TextEditingController();
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
                height: 20,
              ),
              TextFieldWidget(
                  width: 325, label: 'Student Id', controller: studentId),
              TextFieldWidget(
                width: 325,
                label: 'Password',
                controller: password,
                showEye: true,
                isObscure: true,
              ),
              const SizedBox(
                height: 75,
              ),
              ButtonWidget(
                color: primary,
                radius: 100,
                fontSize: 24,
                label: 'Login',
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const AfterLoginPage()),
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
