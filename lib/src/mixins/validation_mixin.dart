class ValidationMixin {
  String validateEmail(String email) {
    if (!email.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(String password) {
    if (password.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }
}
