import 'package:assignment/Controllers/Notification.dart';
import 'package:assignment/Screens/AlertScreen.dart';
import 'package:assignment/Screens/SecondScreen.dart';
import 'package:assignment/Screens/ThirdScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("State: $state");
    switch (state) {
      case AppLifecycleState.paused:
        Get.to(() => const Alert());
        break;
      case AppLifecycleState.resumed:
        Get.to(() => const Alert());
        break;
      case AppLifecycleState.detached:
        Get.to(() => const Alert());
        break;
      case AppLifecycleState.inactive:
        Get.to(() => const Alert());
        break;
    }
  }

  late NotificationAPI noti;

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    noti = NotificationAPI();
    noti.init();
    listenNotification();
    super.initState();
  }

  void listenNotification() async {
    noti.onNotification.stream.listen(onClickedNotification);
  }

  void onClickedNotification(payload) {
    if (payload == 'second') {
      Get.to(() => const SecondScreen());
    } else if (payload == 'third') {
      Get.to(() => const ThirdScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Assignment')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  noti.showNotification(
                      title: 'Hello',
                      body: 'I will open Second Screen',
                      payload: "second");
                },
                child: const Text("Notification for Second Screen"),
              ),
              ElevatedButton(
                onPressed: () {
                  noti.showNotification(
                      title: 'Hi',
                      body: 'I will open Third Screen',
                      payload: "third");
                },
                child: const Text("Notification for Third Screen"),
              ),
            ],
          ),
        ));
  }
}
