import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alert extends StatefulWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Alert',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.defaultDialog(
                          title: '...',
                          content: const Text(
                            "Accepted",
                            style: TextStyle(fontSize: 20),
                          ));
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(fontSize: 20),
                    )),
                ElevatedButton(
                    onPressed: () {
                      Get.defaultDialog(
                          title: '...',
                          content: const Text(
                            "Not Accepted",
                            style: TextStyle(fontSize: 20),
                          ));
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Back'))
          ],
        ),
      ),
    );
  }
}
