import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fs_practice/data.dart';
import 'package:fs_practice/models/user.dart';

//*-----------------------------------------------------------------------------
Future<void> createDocumentsForTwoCollections(UserX data) async {
  // final docId = UniqueKey().toString();
  var nama = data.nama;
  final docId = data.id;
  final createdAt = data.createdAt;

  await FirebaseFirestore.instance.collection('username').doc(docId).set({
    'nama': nama,
    'id': docId,
    'created_at': createdAt,
  });
  await FirebaseFirestore.instance.collection('usernameDetail').doc(docId).set(data.toMap());
}

Future<List<UserX>> getColl() async {
  List<UserX> users = [];
  final result = await FirebaseFirestore.instance
      .collection('username')
      .orderBy(
        'created_at',
        descending: true,
      )
      .limit(3)
      .startAfter([userList.isEmpty ? "9999-99-99" : userList.last.createdAt]).get();
  for (var element in result.docs) {
    users.add(UserX.fromMap(element.data()));
  }

  return users;
}

addToList() async {
  final data = await getColl();
  userList.addAll(data);

  if (data.length < 2) {
    isEnd = true;
  }
}

Future<UserX> readUsernameDetailDocs(String id) async {
  final result = await FirebaseFirestore.instance.collection('usernameDetail').doc(id).get();

  final user = UserX.fromMap(result.data() ?? {});

  return user;
}


//*-----------------------------------------------------------------------------




// Future<void> createDocument(Map<String, dynamic> data) async {
//   await FirebaseFirestore.instance.collection('username').doc().set(data);
// }
