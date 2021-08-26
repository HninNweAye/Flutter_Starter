import 'package:flutter/material.dart';

class IsmpFormInput extends StatefulWidget {
  const IsmpFormInput({
    Key? key,
    required this.controller,
    required this.labelText,
    this.helperText,
    this.icon,
    this.autoFocus,
    this.keyboard,
    this.textInputAction,
    this.validator,
    this.maxLength,
  }) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final String? helperText;
  final Icon? icon;
  final bool? autoFocus;
  final TextInputType? keyboard;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final int? maxLength;

  @override
  _IsmpFormInputState createState() => _IsmpFormInputState();
}

class _IsmpFormInputState extends State<IsmpFormInput> {
  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        autofocus: widget.autoFocus ?? false,
        keyboardType: widget.keyboard ?? TextInputType.text,
        maxLength: widget.maxLength,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        style: const TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          labelText: widget.labelText,
          helperText: widget.helperText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
