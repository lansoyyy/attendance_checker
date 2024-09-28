import 'package:attendance_checker/screens/auth/signup_two_page.dart';
import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/header_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class SignupOnePage extends StatefulWidget {
  String type;
  SignupOnePage({super.key, required this.type});

  @override
  State<SignupOnePage> createState() => _SignupOnePageState();
}

class _SignupOnePageState extends State<SignupOnePage> {
  final fname = TextEditingController();
  final lname = TextEditingController();
  final course = TextEditingController();
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
                text: widget.type,
                fontSize: 38,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  width: 325, label: 'Firstname', controller: fname),
              TextFieldWidget(width: 325, label: 'Lastname', controller: lname),
              TextFieldWidget(width: 325, label: 'Course', controller: course),
              TextFieldWidget(
                  width: 325,
                  label: '${widget.type} Id',
                  controller: studentId),
              TextFieldWidget(
                  width: 325,
                  label: '${widget.type} Id',
                  controller: studentId),
              TextFieldWidget(
                width: 325,
                label: 'Password',
                controller: password,
                showEye: true,
                isObscure: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                color: primary,
                radius: 100,
                fontSize: 24,
                label: 'Proceed',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => SignupTwoPage(
                              type: widget.type,
                            )),
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
