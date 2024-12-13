import 'package:attendance_checker/screens/qr_screen.dart';
import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/utils/const.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/toast_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String myname = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Student')
              .doc(userId)
              .snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading'));
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            dynamic data = snapshot.data;
            myname = '${data['fname']} ${data['lname']}';
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      color: primary,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 125),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/EATS.png',
                              width: 150,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextWidget(
                              text: 'Student ID',
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Regular',
                            ),
                            TextWidget(
                              text: data['email'].toString().split('@')[0],
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'Bold',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 170, left: 20),
                          child: CircleAvatar(
                            minRadius: 75,
                            maxRadius: 75,
                            backgroundImage: AssetImage(
                              'assets/images/profile.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 250, left: 50),
                          child: Column(
                            children: [
                              TextWidget(
                                text: '${data['fname']} ${data['lname']}',
                                fontSize: 32,
                                color: primary,
                                fontFamily: 'Bold',
                              ),
                              TextWidget(
                                text: data['course'],
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: 'Medium',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: 'My Schedules',
                  fontSize: 24,
                  color: primary,
                  fontFamily: 'Bold',
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Class')
                        .where('students', arrayContains: userId)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return const Center(child: Text('Error'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Center(
                              child: CircularProgressIndicator(
                            color: Colors.black,
                          )),
                        );
                      }

                      final data = snapshot.requireData;
                      return Expanded(
                        child: GridView.builder(
                          itemCount: data.docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => QRScreen(
                                            data: data.docs[index],
                                            type: 'Student',
                                          )),
                                );
                              },
                              child: Card(
                                color: secondary,
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: data.docs[index]['subname'],
                                          fontSize: 18,
                                          color: primary,
                                          fontFamily: 'Bold',
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        for (int i = 0;
                                            i <
                                                data.docs[index]['schedule']
                                                    .length;
                                            i++)
                                          TextWidget(
                                            text: data.docs[index]['schedule']
                                                [i],
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontFamily: 'Bold',
                                          ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              TextWidget(
                                                text: data.docs[index]
                                                    ['timestart'],
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontFamily: 'Bold',
                                              ),
                                              TextWidget(
                                                text: data.docs[index]
                                                    ['timeend'],
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontFamily: 'Bold',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: const BoxDecoration(color: primary),
                    child: GestureDetector(
                      onTap: () {
                        scanQRCode();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Icon(
                                Icons.qr_code_scanner_sharp,
                                color: primary,
                                size: 40,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWidget(
                            text: 'Scan',
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Bold',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  String qrCode = 'Unknown';

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
        },
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
      await FirebaseFirestore.instance.collection('Class').doc(qrCode).update({
        'students': FieldValue.arrayUnion([
          {
            'name': myname,
            'time': DateFormat('h:mm a').format(DateTime.now()),
            'date': DateFormat('dd/MM/yyyy').format(DateTime.now()),
          }
        ])
      });
      Navigator.pop(context);
      showToast('Attendance recorded!');
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
