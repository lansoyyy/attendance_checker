import 'package:attendance_checker/utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future addUser(type, fname, lname, course, email) async {
  final docUser = FirebaseFirestore.instance.collection(type).doc(userId);

  final json = {
    'type': type,
    'fname': fname,
    'lname': lname,
    'course': course,
    'email': email,
    'id': docUser.id,
    'isVerified': false,
    'profile': '',
  };

  await docUser.set(json);
}
