
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:package_info/package_info.dart';
import 'main.dart';

import 'app.dart';
import 'config.dart';

void main() {
  PackageInfo.fromPlatform().then((packageInfo) {
    runApp(const SlidableAutoCloseBehavior(
      child: MyApp(),
    ));
  });
}