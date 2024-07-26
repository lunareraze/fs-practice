import 'package:flutter/material.dart';
import 'package:fs_practice/ui_screen/ctrl.dart';
import 'package:fs_practice/ui_screen/input.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
                    (index) => Card(
                      child: ListTile(
                        title: Text(snapshot.data!.docs[index].data()['nama']),
                        // subtitle: Text(snapshot.data!.docs[index].data()['id'].toString()),
                        subtitle: Text(snapshot.data!.docs[index].data()['id'].toString()),
                      ),
                    ),
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
