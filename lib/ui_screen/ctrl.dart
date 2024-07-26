import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> createDocument(Map<String, dynamic> data) async {
  await FirebaseFirestore.instance.collection('username').doc().set(data);
}

Future<void> createDocumentsForTwoCollections(Map<String, dynamic> data) async {
  final docId = UniqueKey().toString();

  await FirebaseFirestore.instance.collection('username').doc(docId).set(data);
  await FirebaseFirestore.instance.collection('usernameDetail').doc(docId).set(data);
}

Future<QuerySnapshot<Map<String, dynamic>>> getColl() async {
  final result = await FirebaseFirestore.instance.collection('username').get();

  return result;
}

Future<DocumentSnapshot<Map<String, dynamic>>> readUsernameDetail(String id) async {
  final result = await FirebaseFirestore.instance.collection('username').doc(id).get();

  return result;
}
