import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatelessWidget {
  dynamic data;

  QRScreen({super.key, required this.data});
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
                text: data['subname'],
                fontSize: 32,
                color: primary,
                fontFamily: 'Bold',
              ),
              TextWidget(
                text: '${data['timestart']} ${data['timeend']}',
                fontSize: 18,
                color: primary,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                width: 300,
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: QrImageView(data: data.id)),
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
                          for (int i = 0; i < data['students'].length; i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 45),
                                  child: TextWidget(
                                    text: data['students'][i]['name'],
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontFamily: 'Medium',
                                  ),
                                ),
                                TextWidget(
                                  text: data['students'][i]['time'],
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Medium',
                                ),
                                TextWidget(
                                  text: data['students'][i]['date'],
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
