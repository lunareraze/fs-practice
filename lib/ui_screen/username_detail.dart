import 'package:flutter/material.dart';
import 'package:fs_practice/ctrl.dart';

class UsernameDetail extends StatelessWidget {
  const UsernameDetail({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Username Detail'),
        ),
        body: FutureBuilder(
          future: readUsernameDetailDocs(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.data()!['nama'].toString()),
                    Text(snapshot.data!.data()!['umur'].toString()),
                    Text(snapshot.data!.data()!['id'].toString()),
                  ],
                ),
              );
            }
            return const Center(child: Text('detail page'));
          },
        ));
  }
}
