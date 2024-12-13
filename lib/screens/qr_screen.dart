import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/toast_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatelessWidget {
  dynamic data;

  String type;

  QRScreen({super.key, required this.data, required this.type});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: type == 'Proof'
          ? FloatingActionButton(
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                showStudents(context);
              },
            )
          : null,
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
                                text: 'Email',
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
                            StreamBuilder<DocumentSnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('Student')
                                    .doc(data['students'][i])
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(child: Text('Loading'));
                                  } else if (snapshot.hasError) {
                                    return const Center(
                                        child: Text('Something went wrong'));
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  dynamic studentData = snapshot.data;
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 25),
                                        child: TextWidget(
                                          text:
                                              '${studentData['fname']} ${studentData['lname']}',
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontFamily: 'Medium',
                                        ),
                                      ),
                                      TextWidget(
                                        text: studentData['email'],
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: 'Medium',
                                      ),
                                    ],
                                  );
                                }),
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

  final searchController = TextEditingController();
  String nameSearched = '';
  showStudents(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: StatefulBuilder(builder: (context, setState) {
            return SizedBox(
              height: 300,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Regular',
                                  fontSize: 14),
                              onChanged: (value) {
                                setState(() {
                                  nameSearched = value;
                                });
                              },
                              decoration: const InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  hintText: 'Search Student',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Regular', fontSize: 18),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  )),
                              controller: searchController,
                            ),
                          ),
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Student')
                              .where('fname',
                                  isGreaterThanOrEqualTo:
                                      toBeginningOfSentenceCase(nameSearched))
                              .where('fname',
                                  isLessThan:
                                      '${toBeginningOfSentenceCase(nameSearched)}z')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print(snapshot.error);
                              return const Center(child: Text('Error'));
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.black,
                                )),
                              );
                            }

                            final studentData = snapshot.requireData;
                            return Column(
                              children: [
                                for (int i = 0;
                                    i < studentData.docs.length;
                                    i++)
                                  ListTile(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      await FirebaseFirestore.instance
                                          .collection('Class')
                                          .doc(data.id)
                                          .update({
                                        'students': FieldValue.arrayUnion([
                                          studentData.docs[i].id,
                                        ])
                                      });
                                      showToast('Student added to this class.');
                                    },
                                    leading: const Icon(
                                      Icons.account_circle_rounded,
                                      size: 35,
                                    ),
                                    title: TextWidget(
                                      text:
                                          '${studentData.docs[i]['fname']} ${studentData.docs[i]['lname']}',
                                      fontSize: 18,
                                    ),
                                  ),
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
