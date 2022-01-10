/* returns error message if exists otherwise returns empty string*/
String? emailValidtor({String? value}) {
  if (value == null || value.isEmpty) {
    return "Empty Email Feild";
  } else {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return "Invalid Email Format";
    }
    return null;
  }
}

void passwordValidator({String? value}) {}

bool phoneNumberValidator(String phoneNumber) {
  if (phoneNumber.length > 9) {
    return int.tryParse(phoneNumber) != null;
  }
  return false;
}
