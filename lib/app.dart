// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'models/models.dart';
import 'theme.dart';
import 'config.dart';
import 'factory.dart';
import 'pages/pages.dart';

class WgApp extends StatelessWidget {
  final logger = WgFactory().getLogger('app');
  final store = WgFactory().getStore();
  final persistor = WgFactory().getPersistor();

  WgApp() {
    logger.info(
        'Wgconfig(debug: ${WgConfig.debug}, loggerLevel: ${WgConfig.loggerLevel}');
    persistor.load(store);
  }

  @override
  Widget build(BuildContext context) {
    return PersistorGate(
        persistor: persistor,
        builder: (context) => StoreProvider<AppState>(
              store: store,
              child: MaterialApp(
                title: Wgconfig.packageInfo.appName,
                theme: WgTheme.theme,
                routes: {
                  '/': (context) => BootstrapPage(), //TODO 还有几个路由
                },
              ),
            ));
  }
}
