import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/utilities/theme_globals.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({
    Key? key,
    // required this.onTap,
  }) : super(key: key);
  // final Future<bool> onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.wifi_off,
                size: 60.0,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: kDefaultPadding,
                ),
                child: Text(
                  'No internet connection',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          // Spacer(),
          // CupertinoButton(
          //   color: blueColor,
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 80,
          //     vertical: 20,
          //   ),
          //   borderRadius: BorderRadius.circular(
          //     15.0,
          //   ),
          //   child: Text('Try again'),
          //   onPressed: () => onTap,
          // ),
        ],
      ),
    );
  }
}
