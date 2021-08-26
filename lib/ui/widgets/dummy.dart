
/**
 * ISMP Form Password
 
class IsmpFormPasswordInput extends StatelessWidget {
  const IsmpFormPasswordInput({
    Key? key,
    required this.passwordController,
    required bool hidePassword,
    required this.labelText,
  })  : _hidePassword = hidePassword,
        super(key: key);

  final TextEditingController passwordController;
  final bool _hidePassword;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      validator: (value) => value == null ? "Password can't be empty" : null,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: _hidePassword,
      obscuringCharacter: '*',
      decoration: InputDecoration(
          fillColor: Colors.black.withOpacity(0.2),
          //   filled: true,
          prefixIcon: const Icon(Icons.lock_rounded),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
*/


/**
 * ISMP Form Input
 
class IsmpFormInput extends StatelessWidget {
  const IsmpFormInput(
      {Key? key,
      required this.controller,
      required this.labelText,
      this.validator,
      this.helperText,
      this.autoFocus,
      this.keyboard,
      this.textInputAction})
      : super(key: key);

  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  final String labelText;
  final bool? autoFocus;
  final TextInputType? keyboard;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autofocus: autoFocus ?? false,
      keyboardType: keyboard ?? TextInputType.text,
      //    maxLength: 12,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.black.withOpacity(0.2),
        // filled: true,
        prefixIcon: const Icon(Icons.phone),
        labelText: labelText,
        helperText: helperText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
*/

/**
 * Material(
                child: Container(
                  height: screenHeightPercentage(context, percentage: 0.5),
                  width: screenWidthPercentage(context, percentage: 0.9),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: const Offset(-10, 10),
                            blurRadius: 20,
                            spreadRadius: 4)
                      ]),
                ),
              ),
 */
