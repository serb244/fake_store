
import 'dart:io';

import 'package:flutter/foundation.dart';
const String androidBaseUrl = 'http://10.0.2.2:8000/api/v1/shop/';
const String defaultBaseUrl = 'http://127.0.0.1:8000/api/v1/shop/';
String allCategoriesUrl =  '${getBaseUrl() }categories/';
String categoryByIdUrl =  '${getBaseUrl() }category/';

String getBaseUrl() {
  if(kIsWeb) return defaultBaseUrl;
  if (Platform.isAndroid) {
    return androidBaseUrl;
  } else {
    return defaultBaseUrl;
  }
}