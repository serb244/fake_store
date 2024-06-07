import 'dart:io';

import 'package:flutter/foundation.dart';

const String androidBaseUrl = 'http://10.0.2.2:8000/';
const String defaultBaseUrl = 'http://127.0.0.1:8000/';

/// Categories
String allCategoriesUrl = '${getBaseUrl()}api/v1/shop/categories/';
String categoryByIdUrl = '${getBaseUrl()}api/v1/shop/category/';

///language
String languageListUrl = '${getBaseUrl()}api/v1/shop/languages/';
String languageDetailUrl = '${getBaseUrl()}api/v1/shop/language/';

///Auth
String registrationUrl = '${getBaseUrl()}api/v1/user/register/';
String loginUrl = '${getBaseUrl()}api/v1/user/login/';
String loginUrl2 = '${getBaseUrl()}api/v1/token/';
String refreshTokenUrl = '${getBaseUrl()}api/v1/token/refresh/';

String getBaseUrl() {
  if (kIsWeb) return defaultBaseUrl;
  if (Platform.isAndroid) {
    return androidBaseUrl;
  } else {
    return defaultBaseUrl;
  }
}
