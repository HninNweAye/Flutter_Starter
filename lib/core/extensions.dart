import 'package:ismp_starter/state_mgnt/provider/network_status_provider.dart';

extension ExtendedString on String {
  bool validatePwdPolicy11() {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(this);
  }

  String? validatePwdPolicy() {
    const regList = ['[a-z]', '[A-Z]', '[0-9]', r'[!@#\$&*~]'];
    const errorList = [
      'Must have at least a lowercase',
      'Must have at least a Uppercase',
      'Must have at least a number',
      'Must have a special character'
    ];
    RegExp regExp;
    if (length < 8) {
      return 'Must Have at least 7 characters.';
    }
    for (var i = 0; i < regList.length; i++) {
      regExp = RegExp(regList[i]);
      if (!regExp.hasMatch(this)) {
        return errorList[i];
      }
    }
    return null;
  }
}

extension ParseToString on NetworkStatus {
  String value() {
    return toString().split('.').last;
  }
}
