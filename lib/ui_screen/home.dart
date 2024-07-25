import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection('username').doc().set(
                  {
                    'id': 'this is id',
                    'nama': 'shane',
                    'umur': 22,
                  },
                );
              },
              child: const Text('C'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () async {
                final result = await FirebaseFirestore.instance.collection('username').get();

                debugPrint(result.toString());
                debugPrint(result.docs.toString());
                debugPrint(result.docs[0].data().toString());

                //* this one under this is for when you included the docs on the function,
                //* then you can access the data by running this dePrint below:
                // debugPrint(result.data().toString());
              },
              child: const Text('R'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection('username').doc('2eBaMc2LbsgA8cmSruM7').update({
                  'id': "this is new id from update",
                  "nama": "shane filan one",
                  "umur": 24,
                });
              },
              child: const Text('U'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              child: const Text('D'),
            ),
          ],
        ),
      ),
    );
  }
}
