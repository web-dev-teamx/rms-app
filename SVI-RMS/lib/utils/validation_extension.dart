extension ValidationExtension on String {
  bool validateFullName() {
    final regex = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");

    return regex.hasMatch(this);
  }

  bool validateEmail() {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    return regex.hasMatch(this);
  }

  bool validatePassword() {
    final regex = RegExp(r'^.{8,}$');
    return regex.hasMatch(this);
  }

  bool validateVerificationCode() {
    final regex = RegExp(r'^(\d{4})$');
    return regex.hasMatch(this);
  }
}
