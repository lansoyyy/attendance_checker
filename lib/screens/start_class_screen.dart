import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class StartClassScreen extends StatefulWidget {
  const StartClassScreen({super.key});

  @override
  State<StartClassScreen> createState() => _StartClassScreenState();
}

class _StartClassScreenState extends State<StartClassScreen> {
  final subname = TextEditingController();
  final time1 = TextEditingController();
  final time2 = TextEditingController();
  final days = TextEditingController();
  final pen1 = TextEditingController();
  final pen2 = TextEditingController();
  final pen3 = TextEditingController();

  List schedules = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              TextFieldWidget(label: 'Subject Name', controller: subname),
              TextWidget(
                text: 'Select Schedule',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < schedules.length; i++)
                      Card(
                        child: SizedBox(
                          width: 75,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextWidget(
                                text:
                                    '${schedules[i][0]} ${schedules[i][1]} ${schedules[i][2]}',
                                fontSize: 18,
                                fontFamily: 'Bold',
                                color: primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: 'Time/Duration',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextFieldWidget(
                      label: 'Start',
                      controller: time1,
                      inputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextFieldWidget(
                      label: 'End',
                      controller: time2,
                      inputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: 'Number of Days',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              TextFieldWidget(
                label: 'Days',
                controller: days,
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: 'Penalties',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 75,
                    child: TextFieldWidget(
                      label: '',
                      controller: pen1,
                      inputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextWidget(
                    text: '% of Total Days = DROP',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 75,
                    child: TextFieldWidget(
                      label: '',
                      controller: pen2,
                      inputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextWidget(
                    text: 'Consecutive Absent = DROP',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 75,
                    child: TextFieldWidget(
                      label: '',
                      controller: pen3,
                      inputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextWidget(
                    text: 'Minutes Late = - 0.5 Day',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              ButtonWidget(
                label: 'Create',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
