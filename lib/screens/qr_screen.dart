import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/EATS.png',
                width: 200,
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: 'Subject Name Code',
                fontSize: 32,
                color: primary,
                fontFamily: 'Bold',
              ),
              TextWidget(
                text: 'Time Schedule',
                fontSize: 18,
                color: primary,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: 'Will Expire in',
                fontSize: 22,
                color: primary,
                fontFamily: 'Medium',
              ),
              TextWidget(
                text: '12:00',
                fontSize: 32,
                color: Colors.white,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/qr.png',
                    width: 200,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: 'Class Log',
                fontSize: 24,
                color: primary,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                text: 'Student',
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Bold',
                              ),
                              TextWidget(
                                text: 'Time',
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Bold',
                              ),
                              TextWidget(
                                text: 'Date',
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Bold',
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          for (int i = 0; i < 5; i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 45),
                                  child: TextWidget(
                                    text: 'John Doe',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                                TextWidget(
                                  text: '12:00PM',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Medium',
                                ),
                                TextWidget(
                                  text: 'Jan 01, 2025',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Medium',
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
