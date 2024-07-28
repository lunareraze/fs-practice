import 'package:cloud_firestore/cloud_firestore.dart';
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

Future<QuerySnapshot<Map<String, dynamic>>> getColl() async {
  final result = await FirebaseFirestore.instance.collection('username').get();

  return result;
}

Future<UserX> readUsernameDetailDocs(String id) async {
  final result = await FirebaseFirestore.instance.collection('usernameDetail').doc(id).get();

  final user = UserX.fromMap(result.data() ?? {});

  return user;
}
