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
              final detailx = snapshot.data!;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(detailx.id),
                    Text(detailx.nama),
                    Text(
                      detailx.umur.toString(),
                    ),
                    Text(detailx.createAt),
                  ],
                ),
              );
            }
            return const Center(child: Text('detail page'));
          },
        ));
  }
}
