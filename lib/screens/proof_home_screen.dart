import 'package:attendance_checker/screens/qr_screen.dart';
import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/utils/const.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProofHomeScreen extends StatelessWidget {
  const ProofHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Professor')
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
                              text: 'Professor ID',
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
                                text: 'Professor',
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
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const QRScreen()),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: 'Subject',
                                    fontSize: 18,
                                    color: primary,
                                    fontFamily: 'Bold',
                                  ),
                                  TextWidget(
                                    text: 'Name/Code',
                                    fontSize: 18,
                                    color: primary,
                                    fontFamily: 'Bold',
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  TextWidget(
                                    text: 'Tue-Fri',
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
                                          text: '7:30AM',
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontFamily: 'Bold',
                                        ),
                                        TextWidget(
                                          text: '10:30AM',
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
                ),
              ],
            );
          }),
    );
  }
}
