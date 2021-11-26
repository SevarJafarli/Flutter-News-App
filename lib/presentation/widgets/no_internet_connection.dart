import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.wifi_off,
            size: 50.0,
            color: Colors.grey,
          ),
          Text(
            'No internet connection',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
