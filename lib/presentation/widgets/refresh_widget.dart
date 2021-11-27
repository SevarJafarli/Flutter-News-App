import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({
    Key? key,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);
  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? buildAndroidRefreshIndicator()
        : buildIOSRefreshIndicator();
  }

  Widget buildAndroidRefreshIndicator() {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
    );
  }

  Widget buildIOSRefreshIndicator() {
    return CustomScrollView(
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
        ),
        SliverToBoxAdapter(
          child: child,
        ),
      ],
    );
  }
}
