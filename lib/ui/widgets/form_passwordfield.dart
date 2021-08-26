import 'package:flutter/material.dart';
import 'package:ismp_starter/core/extensions.dart';

class IsmpFormPasswordField extends StatefulWidget {
  const IsmpFormPasswordField({
    Key? key,
    required this.controller,
    this.labelText,
  }) : super(key: key);

  final TextEditingController controller;
  final String? labelText;
  @override
  _IsmpFormPasswordFieldState createState() => _IsmpFormPasswordFieldState();
}

class _IsmpFormPasswordFieldState extends State<IsmpFormPasswordField> {
  bool _hidePassword = true;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);

    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (val) =>
          val == null ? 'Password is empty' : val.validatePwdPolicy(),
      autofocus: true,
      obscureText: _hidePassword,
      obscuringCharacter: '*',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        color: Colors.black45,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: widget.controller.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: Icon(
                    _hidePassword ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                },
              ),
        labelText: widget.labelText ?? 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
