class ValidationMixin {
  String? validateEmail(String value) {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Please enter a valid email";
    }

    if (value.trim().isEmpty) {
      return "Please enter email";
    }

    return null;
  }

  String? validatePassword(String value,
      {bool isConfirmPassword = false, String confirmValue = ""}) {
    if (value.trim().isEmpty) {
      return "Please enter password";
    }

    if (isConfirmPassword) {
      if (value != confirmValue) {
        return "Passwords is not match";
      }
    }
    return null;
  }

  String? validate(String value, String title) {
    if (value.trim().isEmpty) {
      return "Please enter your $title";
    }
    return null;
  }

  String? validat(String value, String title) {
    if (value.trim().isEmpty) {
      return "Please enter your @$title";
    }
    return null;
  }

  String? validateAge(String value) {
    if (value.trim().isEmpty) {
      return "Please enter your age";
    } else if (int.tryParse(value) == null) {
      return "Please enter age in number";
    }
    if (int.parse(value) < 0 || int.parse(value) > 120) {
      return "Please enter age in range 0-120";
    }
    return null;
  }

  String? validateAddress(String address) {
    if (address.trim().isEmpty) {
      return "Please enter your address";
    }
    return null;
  }
}
