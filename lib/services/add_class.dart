import 'package:attendance_checker/utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future addClass(
    subname, schedule, timestart, timeend, days, pen1, pen2, pen3) async {
  final docUser = FirebaseFirestore.instance.collection('Class').doc();

  final json = {
    'uid': userId,
    'rangefrom': 0,
    'rangeto': 0,
    'subname': subname,
    'schedule': schedule,
    'timestart': timestart,
    'timeend': timeend,
    'days': days,
    'pen1': pen1,
    'pen2': pen2,
    'pen3': pen3,
    'id': docUser.id,
    'isStarted': false,
    'students': [],
  };

  await docUser.set(json);
}
