class LoginFormValidationMixin {
  String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter email id";
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value)) {
      return "Please enter valid email";
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter a password";
    }

    return null;
  }
}
