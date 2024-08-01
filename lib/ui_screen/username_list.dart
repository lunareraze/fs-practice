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
  //* to show data before loadmore being tapped.
  @override
  void initState() {
    addToList();
    debugPrint('ini init..');
    super.initState();
  }

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
            heroTag: null,
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
            heroTag: null,
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
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                          // snapshot.data!.length,
                          // userList.length,
                          userList.length,
                          (index) {
                            // final data = snapshot.data![index];
                            final data = userList[index];
                            final id = data.id;
                            return Card(
                              child: ListTile(
                                title: Text(data.nama),
                                // title: Text(snapshot.data!.docs[index].data()['nama']),
                                // subtitle: Text(snapshot.data!.docs[index].data()['id'].toString()),
                                subtitle: Text(data.createdAt),
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
                        ),
                        snapshot.connectionState == ConnectionState.waiting
                            ? const CircularProgressIndicator()
                            : OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    addToList();
                                  });
                                },
                                child: const Text('load more..'),
                              )
                      ],
                    ),
                  );
                }
                return const Text('home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
