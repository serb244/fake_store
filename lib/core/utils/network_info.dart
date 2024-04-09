import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

mixin ConnectivityMixin {
  Future<bool> get isConnected async {
    final List<ConnectivityResult> connectivityResult = await getConnectivityList();
    final bool isConnected = !connectivityResult.contains(ConnectivityResult.none);
    return isConnected;
  }


  Future<bool> get isWifi async {
    final List<ConnectivityResult> connectivityResult = await getConnectivityList();
    final bool isWifi = connectivityResult.contains(ConnectivityResult.wifi);
    return isWifi;
  }

  Future<bool> get isMobile async {
    final List<ConnectivityResult> connectivityResult = await getConnectivityList();
    final bool isMobile = connectivityResult.contains(ConnectivityResult.mobile);
    return isMobile;
  }

  Future<bool> get isBluetooth async {
    final List<ConnectivityResult> connectivityResult = await getConnectivityList();
    final bool isBluetooth = connectivityResult.contains(ConnectivityResult.bluetooth);
    return isBluetooth;
  }

  Future<List<ConnectivityResult>> getConnectivityList() async {
    return await Connectivity().checkConnectivity();
  }
  // Future<bool> get isConnectedByRequest async {
  //   List<String> addresses = ["google.com", "1.1.1.1", "apple.com"];
  //   for (var address in addresses) {
  //     try {
  //       if (await getSiteConnected(address) == true) {
  //         return true;
  //       }
  //     } catch (_) {}
  //   }
  //   return false;
  // }
  //
  // Future<bool> getSiteConnected(String url) async {
  //   try {
  //     var addresses = await InternetAddress.lookup(url);
  //     if (addresses.isNotEmpty && addresses[0].rawAddress.isNotEmpty) {
  //       var response = await Dio().get(url);
  //       if (response.statusCode == 200) {
  //         return true;
  //       }
  //     }
  //   } catch (_) {
  //   }
  //
  //   return false;
  // }
}
