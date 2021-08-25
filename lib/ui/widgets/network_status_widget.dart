import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ismp_starter/state_mgnt/provider/network_status_provider.dart';
import 'package:ismp_starter/core/extensions.dart';

class NetworkStatusWidget extends ConsumerWidget {
  const NetworkStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final network = watch(networkStatusProvider);
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 10,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color:
                  network == NetworkStatus.online ? Colors.green : Colors.red,
              shape: BoxShape.circle),
        ),
        Text(
          network.value(),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
