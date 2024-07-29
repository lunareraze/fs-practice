import 'package:flutter/material.dart';
import 'package:fs_practice/ctrl.dart';
import 'package:fs_practice/data.dart';
import 'package:fs_practice/models/user.dart';

class PageInput extends StatefulWidget {
  const PageInput({super.key});

  @override
  State<PageInput> createState() => _PageInputState();
}

class _PageInputState extends State<PageInput> {
  //* make this variable to changed the clear on Page Input
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: ctrl1,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'nama',
                    suffixIcon: isShowClear1
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isShowClear1 = false;
                              });
                              ctrl1.clear();
                            },
                            icon: const Icon(Icons.clear))
                        : null),
                onChanged: (value) {
                  setState(() {
                    isShowClear1 = value.isNotEmpty;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: ctrl2,
                decoration: InputDecoration(
                    hintText: 'umur',
                    border: const OutlineInputBorder(),
                    suffixIcon: isShowClear2
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isShowClear2 = false;
                              });
                              ctrl2.clear();
                            },
                            icon: const Icon(Icons.clear))
                        : null),
                onChanged: (value) {
                  setState(() {
                    isShowClear2 = value.isNotEmpty;
                  });
                },
              ),
              const SizedBox(height: 30),
              // OutlinedButton(
              //   onPressed: () {
              //     ctrl1.clear();
              //     ctrl2.clear();
              //   },
              //   child: const Text('clear'),
              // ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () async {
                  var a = ctrl1.text;
                  var b = int.parse(ctrl2.text);
                  debugPrint(a);
                  debugPrint(a.runtimeType.toString());
                  debugPrint(b.toString());
                  debugPrint(b.runtimeType.toString());

                  // var data = {'nama': a, 'umur': b};

                  final newUser = UserX(
                    nama: a,
                    umur: b,
                    id: UniqueKey().toString(),
                  );

                  setState(() {
                    isLoading = true;
                  });
                  // await createDocument(data);
                  await createDocumentsForTwoCollections(newUser);
                  setState(() {
                    isLoading = false;
                  });
                  ctrl1.clear();
                  ctrl2.clear();
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: Text(isLoading ? 'loading..' : 'submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
