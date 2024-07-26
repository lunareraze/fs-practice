import 'package:flutter/material.dart';
import 'package:fs_practice/ui_screen/ctrl.dart';
import 'package:fs_practice/ui_screen/input.dart';
import 'package:fs_practice/ui_screen/username_detail.dart';

class UsernameList extends StatelessWidget {
  const UsernameList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PageInput(),
            ),
          );
        },
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: getColl(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                      children: List.generate(
                    snapshot.data!.docs.length,
                    (index) {
                      final id = snapshot.data!.docs[index].id;
                      return Card(
                        child: ListTile(
                          title: Text(snapshot.data!.docs[index].data()['nama']),
                          // subtitle: Text(snapshot.data!.docs[index].data()['id'].toString()),
                          subtitle: Text(snapshot.data!.docs[index].data()['id'].toString()),

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UsernameDetail(
                                  id: id,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ));
                }

                return const Text('home');
              },
            )
          ],
        ),
      ),
    );
  }
}
