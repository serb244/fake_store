import 'package:connectivity_plus/connectivity_plus.dart';

mixin ConnectivityMixin {
  Future<bool> get isConnected async {
    final List<ConnectivityResult> connectivityResult = await getConnectivityList();
    final bool isConnected = !connectivityResult.contains(ConnectivityResult.none);
    return isConnected;
  }

  Stream<List<ConnectivityResult>> monitorNetworkConnectivityChangesStream() {
    final stream = Connectivity().onConnectivityChanged;
    // stream.listen((connectivityResultList) {
    //   for (var connectivityResult in connectivityResultList) {
    //     log(connectivityResult.toString());
    //   }
    // });
    return stream;
  }
  Stream<bool> hasInternetConnectionStream () {
    return monitorNetworkConnectivityChangesStream().map((event) => event.contains(ConnectivityResult.none) == false);
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
}
