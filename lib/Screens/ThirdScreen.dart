import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third Screen')),
      body: SizedBox(
        width: Get.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Third Screen"),
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
