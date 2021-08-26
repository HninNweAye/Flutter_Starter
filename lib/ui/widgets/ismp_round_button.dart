import 'package:flutter/material.dart';
import 'package:ismp_starter/core/styles.dart';

class IsmpRoundButton extends StatelessWidget {
  const IsmpRoundButton({Key? key, required this.text, required this.onPress})
      : super(key: key);
  final String text;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: cPrimaryOrange,
        textStyle: const TextStyle(fontSize: 18, color: Colors.white),
        minimumSize: const Size(170, 55),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      onPressed: onPress,
      child: Text(text),
    );
  }
}
