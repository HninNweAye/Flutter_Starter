import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ismp_starter/state_mgnt/provider/network_status_provider.dart';
import 'package:ismp_starter/ui/widgets/network_status_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late StreamSubscription<ConnectivityResult> connSubscription;
  bool isJailBreak = true;
  bool isDeveloperModeOpen = true;
  @override
  void initState() {
    super.initState();
    //Listen and Change Internet Connection Status
    connSubscription = Connectivity().onConnectivityChanged.listen((event) {
      context.read(networkStatusProvider.notifier).changeNetworkStatus(event);
    });

    checkDeviceSafety();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('images/bg.jpeg'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              ' JailBreak : $isJailBreak',
              style: const TextStyle(color: Colors.white),
            ),
            const NetworkStatusWidget(),
          ],
        )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    connSubscription.cancel();
  }

  Future<void> checkDeviceSafety() async {
    //start Jainl_Break_Detection package
    isJailBreak = await FlutterJailbreakDetection.jailbroken;
    debugPrint('isJailBreak $isJailBreak');
    isDeveloperModeOpen = await FlutterJailbreakDetection.developerMode;
//end Jainl_Break_Detection package
  }
}
