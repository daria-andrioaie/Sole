import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'flavors.dart';
import 'navigation/router.dart';

class App extends StatelessWidget {

  final _appRouter = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: F.title,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
