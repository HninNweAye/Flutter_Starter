import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetworkStatus { unKnown, online, offline }
final networkStatusProvider =
    StateNotifierProvider<NetworkStatusNotifier, NetworkStatus>((ref) {
  return NetworkStatusNotifier(NetworkStatus.unKnown);
});

class NetworkStatusNotifier extends StateNotifier<NetworkStatus> {
  NetworkStatusNotifier(NetworkStatus state) : super(state);

  //     First Try
  // NetworkStatusNotifier() : super(NetworkStatus.unKnown) {
  //   var newStatus = NetworkStatus.unKnown;
  //   Connectivity().onConnectivityChanged.listen((event) {
  //     switch (event) {
  //       case ConnectivityResult.mobile:
  //       case ConnectivityResult.wifi:
  //         state = NetworkStatus.on;
  //         break;
  //       case ConnectivityResult.none:
  //         state = NetworkStatus.off;
  //         break;
  //     }
  //   });
  // if (newStatus != state) {
  //   state = newStatus;
  // }

  void changeNetworkStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
        state = NetworkStatus.online;
        break;
      case ConnectivityResult.none:
        state = NetworkStatus.offline;
        break;
    }
  }

  NetworkStatus getNetworkStatus() => state;
}
