class ApiEndPoints {
  static const String domain = "192.168.88.143";
  static const String baseUrl = 'http://$domain:5000/';
  static final _AuthEndPoints authEndpoints = _AuthEndPoints();
  static final _DriverEndPoints driverEndpoints = _DriverEndPoints();
}

class _AuthEndPoints {
  final String signUp = "auth/sign-up/customer";
  final String login = "auth/login";
  final String logout = "auth/logout";
  final String verifyAuth = "auth/verify";
  final String uploadImage = "auth/profile/upload-profile-picture";
  final String getProfileImage = "auth/profile/fetch-profile-picture";
}

class _DriverEndPoints {
  final String getProfile = "drivers/profile";
}
