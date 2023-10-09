import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';
import 'package:shop_app_gorouter/modules/app/cubit/app_cubit.dart';
import 'package:shop_app_gorouter/modules/app/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
//
  const App({super.key});

  @override
  Widget build(BuildContext context) {
//
    return RepositoryProvider(
      create: (context) => StoreRepository(),
      child: BlocProvider(
        create: (context) => AppCubit(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.windows: ZoomPageTransitionsBuilder(),
                TargetPlatform.android: ZoomPageTransitionsBuilder(),
              },
            ),
          ),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            physics: const BouncingScrollPhysics(),
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown,
            },
          ),
          localizationsDelegates: const [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('fa', 'IR'),
            Locale('en', 'US'),
          ],
          locale: const Locale('fa', 'IR'),
          routerConfig: router,
        ),
      ),
    );
  }
}
