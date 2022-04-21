import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: SizedBox(
        width: Get.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Second Screen"),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Go to Home!'))
        ]),
      ),
    );
  }
}
