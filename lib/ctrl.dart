import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fs_practice/models/user.dart';

// Future<void> createDocument(Map<String, dynamic> data) async {
//   await FirebaseFirestore.instance.collection('username').doc().set(data);
// }

//*-----------------------------------------------------------------------------
Future<void> createDocumentsForTwoCollections(Map<String, dynamic> data) async {
  // final docId = UniqueKey().toString();

  var nama = data['nama'];
  final docId = data['id'];

  await FirebaseFirestore.instance.collection('username').doc(docId).set({
    'nama': nama,
    'id': docId,
  });
  await FirebaseFirestore.instance.collection('usernameDetail').doc(docId).set(data);
}

Future<List<UserX>> getColl() async {
  List<UserX> userList = [];
  final result = await FirebaseFirestore.instance.collection('username').get();
  for (var element in result.docs) {
    userList.add(UserX.fromMap(element.data()));
  }

  return userList;
}

Future<UserX> readUsernameDetailDocs(String id) async {
  final result = await FirebaseFirestore.instance.collection('usernameDetail').doc(id).get();

  final user = UserX.fromMap(result.data() ?? {});

  return user;
}
