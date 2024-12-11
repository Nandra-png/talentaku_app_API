class LoginModel {
  String username = '';
  String password = '';

  // Validate if username and password are not empty
  bool get isValid => username.isNotEmpty && password.isNotEmpty;

  // Update username and password
  void updateLoginState(String username, String password) {
    this.username = username;
    this.password = password;
  }
}
