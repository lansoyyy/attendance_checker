import 'package:attendance_checker/screens/start_class_screen.dart';
import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class AddClassScreen extends StatefulWidget {
  const AddClassScreen({super.key});

  @override
  State<AddClassScreen> createState() => _AddClassScreenState();
}

class _AddClassScreenState extends State<AddClassScreen> {
  final time1 = TextEditingController();
  final time2 = TextEditingController();
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
              ButtonWidget(
                label: 'Start Class',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const StartClassScreen()),
                  );
                },
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // ButtonWidget(
              //   label: 'Enroll Student',
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (context) {
              //         return Dialog(
              //           backgroundColor: Colors.white,
              //           child: Padding(
              //             padding: const EdgeInsets.all(15.0),
              //             child: Column(
              //               mainAxisSize: MainAxisSize.min,
              //               children: [
              //                 TextWidget(
              //                   text: 'Student ID Number',
              //                   fontSize: 28,
              //                   fontFamily: 'Bold',
              //                 ),
              //                 Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceEvenly,
              //                   children: [
              //                     SizedBox(
              //                       width: 125,
              //                       child: TextFieldWidget(
              //                         label: '',
              //                         controller: time1,
              //                         inputType: TextInputType.number,
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       width: 125,
              //                       child: TextFieldWidget(
              //                         label: '',
              //                         controller: time2,
              //                         inputType: TextInputType.number,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 const SizedBox(
              //                   height: 20,
              //                 ),
              //                 ButtonWidget(
              //                   radius: 100,
              //                   label: 'Add',
              //                   onPressed: () {
              //                     Navigator.pop(context);
              //                   },
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   },
              // ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: 'Students',
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
                  height: 300,
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
