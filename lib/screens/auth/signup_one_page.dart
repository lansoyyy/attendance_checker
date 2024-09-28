import 'package:attendance_checker/screens/auth/signup_two_page.dart';
import 'package:attendance_checker/services/add_user.dart';
import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/header_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/textfield_widget.dart';
import 'package:attendance_checker/widgets/toast_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                  register(context);
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

  register(context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: '${studentId.text}@${widget.type}.com',
          password: password.text);

      addUser(widget.type, fname.text, lname.text, course.text,
          '${studentId.text}@${widget.type}.com');

      // signup(nameController.text, numberController.text, addressController.text,
      //     emailController.text);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => SignupTwoPage(
                  type: widget.type,
                )),
      );
      showToast("Registered Successfully!");

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showToast('The email address is not valid.');
      } else {
        showToast(e.toString());
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
