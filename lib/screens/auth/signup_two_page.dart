import 'package:attendance_checker/screens/auth/initial_login_page.dart';
import 'package:attendance_checker/screens/home_screen.dart';
import 'package:attendance_checker/screens/proof_home_screen.dart';
import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/header_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/textfield_widget.dart';
import 'package:attendance_checker/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class SignupTwoPage extends StatefulWidget {
  String type;
  SignupTwoPage({
    super.key,
    required this.type,
  });

  @override
  State<SignupTwoPage> createState() => _SignupTwoPageState();
}

class _SignupTwoPageState extends State<SignupTwoPage> {
  late final LocalAuthentication auth;
  bool _supportState = false;

  bool hasAuth = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
      (value) {
        setState(() {
          _supportState = value;
        });
        if (value) {
          showToast('This device supports biometrics.');
        } else {
          showToast("This device doesn't supports biometrics!");
        }
      },
    );
  }

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
              GestureDetector(
                onTap: () async {
                  if (_supportState) {
                    try {
                      final bool didAuthenticate = await auth.authenticate(
                          options: const AuthenticationOptions(
                            biometricOnly: true,
                          ),
                          localizedReason: 'Please authenticate to proceed!');

                      if (didAuthenticate) {
                        setState(() {
                          hasAuth = true;
                        });
                      } else {
                        showToast('Invalid biometrics!');
                      }
                      // ···
                    } on PlatformException {
                      showToast('Something went wrong!');
                      // ...
                    }
                  } else {
                    showToast("This device doesn't supports biometrics!");
                  }
                },
                child: Image.asset(
                  'assets/images/biometrics.png',
                  width: 150,
                  color: hasAuth ? Colors.blue : Colors.grey,
                ),
              ),
              const SizedBox(
                height: 125,
              ),
              Visibility(
                visible: hasAuth,
                child: TextWidget(
                  text: 'You may now proceed',
                  fontSize: 18,
                  fontFamily: 'Medium',
                  color: primary,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: hasAuth,
                child: ButtonWidget(
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
