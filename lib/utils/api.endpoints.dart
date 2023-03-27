class ApiEndPoints {
  static const String domain = "10.1.1.246";
  static const String baseUrl = 'http://$domain:5000/';
  static final _AuthEndPoints authEndpoints = _AuthEndPoints();
  static final _CustomerEndPoints customerEndpoints = _CustomerEndPoints();
}

class _AuthEndPoints {
  final String signUp = "auth/sign-up/customer";
  final String login = "auth/login";
  final String logout = "auth/logout";
  final String verifyAuth = "auth/verify";
  final String uploadImage = "auth/profile/upload-profile-picture";
  final String getProfileImage = "auth/profile/fetch-profile-picture";
}

class _CustomerEndPoints {
  final String updateProfile = "customers/profile";
  String searchMerchant({
    String search = "",
    int limit = 10,
    int offset = 0,
  }) =>
      "merchants?limit=$limit&offset=$offset&search=$search";

  String searchMenu({
    String search = "",
    int limit = 10,
    int offset = 0,
  }) =>
      "merchants/menu/query?limit=$limit&offset=$offset&search=$search";
}
/**
 * query merchant
 * http://localhost:5000/merchants?limit=10&offset=0&search=chant
 */

/**
 * query menu
 * http://localhost:5000/merchants/menu/query?limit=10&offset=0&search=ayam
 */