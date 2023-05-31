class ApiEndPoints {
  static const String domain = "10.6.186.210";
  static const String baseUrl = 'http://$domain:5000/';
  // static const String baseUrl = 'https://2675-149-113-6-220.ngrok-free.app/';
  static final _AuthEndPoints authEndpoints = _AuthEndPoints();
  static final _CustomerEndPoints customerEndpoints = _CustomerEndPoints();
  static final _TransactionEndPoints transactionEndpoints =
      _TransactionEndPoints();
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

  String getMerchantMenu({
    String merchantId = "",
    int limit = 10,
    int offset = 0,
    String restrictions = "000000",
  }) =>
      "merchants/$merchantId/menu?limit=$limit&restrictions=$restrictions&offset=$offset";

  String getCart({
    String merchantId = "",
  }) =>
      "customers/cart/$merchantId";

  String updateCart({
    String merchantId = "",
  }) =>
      "customers/cart/$merchantId";

  String getVouchersByCartId({
    String cartId = "",
  }) =>
      "customers/cart/$cartId/vouchers";
}

class _TransactionEndPoints {
  final String getDomvetBalance = "transactions/wallet";
  final String postTransaction = "transactions";
}
/**
 * query merchant
 * http://localhost:5000/merchants?limit=10&offset=0&search=chant
 */

/**
 * query menu
 * http://localhost:5000/merchants/menu/query?limit=10&offset=0&search=ayam
 */

/**
 * get menu by merchant id
 * http://localhost:5000/merchants/64171e03c849eff0eeb7a441/menu?limit=10&restrictions=000000&offset=0
 */

/**
 * get cart by merchant id
 * http://localhost:5000/customers/cart/64171e03c849eff0eeb7a441
 */

/**
 * update cart by merchant id
 * http://localhost:5000/customers/cart/64171e03c849eff0eeb7a441
 */

/**
 * get vouchers by cart id
 * http://localhost:5000/customers/cart/643b7e92182f159895ffdad7/vouchers
 */