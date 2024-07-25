import 'package:flutter/material.dart';
import 'package:fs_practice/ui_screen/ctrl.dart';

class PageInput extends StatefulWidget {
  const PageInput({super.key});

  @override
  State<PageInput> createState() => _PageInputState();
}

class _PageInputState extends State<PageInput> {
  final ctrl1 = TextEditingController();
  final ctrl2 = TextEditingController();

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: ctrl1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: ctrl2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {
                ctrl1.clear();
                ctrl2.clear();
              },
              child: const Text('clear'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                var a = ctrl1.text;
                var b = int.parse(ctrl2.text);
                debugPrint(a);
                debugPrint(a.runtimeType.toString());
                debugPrint(b.toString());
                debugPrint(b.runtimeType.toString());

                var data = {'nama': a, 'umur': b};
                createDocument(data);
              },
              child: const Text('submit'),
            ),
          ],
        ),
      ),
    );
  }
}
