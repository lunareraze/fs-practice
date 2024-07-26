import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> createDocument(Map<String, dynamic> data) async {
  await FirebaseFirestore.instance.collection('username').doc().set(data);
}

Future<QuerySnapshot<Map<String, dynamic>>> getColl() async {
  final result = await FirebaseFirestore.instance.collection('username').get();

  return result;
}

Future<DocumentSnapshot<Map<String, dynamic>>> readUsernameDetail(String id) async {
  final result = await FirebaseFirestore.instance.collection('username').doc(id).get();

  return result;
}
