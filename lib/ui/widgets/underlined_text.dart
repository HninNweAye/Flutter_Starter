import 'package:flutter/material.dart';
import 'package:ismp_starter/core/styles.dart';

class IsmpUndelinedText extends StatelessWidget {
  const IsmpUndelinedText(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyleUnderline);
  }
}
