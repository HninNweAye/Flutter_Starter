import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_installations/firebase_installations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ismp_starter/core/styles.dart';
import 'package:ismp_starter/core/ui_helper.dart';
import 'package:ismp_starter/state_mgnt/provider/network_status_provider.dart';
import 'package:ismp_starter/ui/widgets/form_passwordfield.dart';
import 'package:ismp_starter/ui/widgets/form_textfield.dart';
import 'package:ismp_starter/ui/widgets/ismp_round_button.dart';
import 'package:ismp_starter/ui/widgets/network_status_widget.dart';
import 'package:ismp_starter/ui/widgets/underlined_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  late StreamSubscription<ConnectivityResult> connSubscription;
  final _formKey = GlobalKey<FormState>();
  bool isJailBreak = true;
  bool isDeveloperModeOpen = true;
  String? _devID;
  @override
  void initState() {
    super.initState();
    //Listen and Change Internet Connection Status
    Connectivity().checkConnectivity().then((value) => context
        .read(networkStatusProvider.notifier)
        .changeNetworkStatus(value));
    connSubscription = Connectivity().onConnectivityChanged.listen((event) {
      context.read(networkStatusProvider.notifier).changeNetworkStatus(event);
    });
    checkDeviceSafety();
    FirebaseInstallations.id.then((value) {
      setState(() {
        _devID = value;
      });
    });
  }

  void _btnLoginPress() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('LoginScreen Build()');
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('images/bg.jpg'))),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LogoImage(),
                verticalSpaceRegular,
                const Text(' ISMP Mobile', style: txtStyleAppTitle),
                verticalSpaceRegular,
                _loginCard(context, phoneController, passwordController),
                // Text(' JailBreak : $isJailBreak',
                //     style: const TextStyle(color: Colors.white)),
                Text(' Firebase Installation ID : $_devID',
                    style: const TextStyle(color: Colors.white)),
                const NetworkStatusWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center _loginCard(BuildContext context, TextEditingController phoneController,
      TextEditingController passwordController) {
    return Center(
      child: Card(
        color: Colors.white54,
        elevation: 10,
        shadowColor: Colors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: screenHeightPercentage(context, percentage: 0.45),
          width: screenWidthPercentage(context, percentage: 0.8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(-10, 10),
                    blurRadius: 20,
                    spreadRadius: 4)
              ]),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 30, right: 20, bottom: 10),
              child: Column(
                children: [
                  // IsmpFormInput(
                  //   controller: phoneController,
                  //   validator: (value) =>
                  //       value == null ? "phone number can't be empty" : null,
                  //   labelText: 'Phone',
                  //   keyboard: TextInputType.phone,
                  // ),
                  IsmpFormInput(
                      controller: phoneController,
                      labelText: 'Phone',
                      keyboard: TextInputType.phone,
                      icon: const Icon(Icons.phone_rounded),
                      autoFocus: true,
                      validator: (val) => (val == null || val.isEmpty)
                          ? 'Email is invalid!'
                          : null),
                  verticalSpaceMedium,
                  IsmpFormPasswordField(
                    controller: passwordController,
                  ),
                  verticalSpaceLarge,
                  IsmpRoundButton(text: 'Login', onPress: _btnLoginPress),
                  verticalSpaceSmall,
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const IsmpUndelinedText('Forgot Password'),
                        const IsmpUndelinedText('Register'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
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

class LogoImage extends StatelessWidget {
  const LogoImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('images/ismp.png'))));
  }
}
