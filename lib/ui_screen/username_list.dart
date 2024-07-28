import 'package:flutter/material.dart';
import 'package:fs_practice/ctrl.dart';
import 'package:fs_practice/data.dart';
import 'package:fs_practice/ui_screen/username_input.dart';
import 'package:fs_practice/ui_screen/username_detail.dart';

class UsernameList extends StatefulWidget {
  const UsernameList({super.key});

  @override
  State<UsernameList> createState() => _UsernameListState();
}

class _UsernameListState extends State<UsernameList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username List'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
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
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {});
            },
            child: const Icon(Icons.refresh),
          ),
        ],
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
                          selected: selectedId == id,
                          tileColor: Colors.transparent,
                          selectedColor: Colors.blue,

                          onTap: () {
                            setState(() {
                              selectedId = id;
                            });

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
