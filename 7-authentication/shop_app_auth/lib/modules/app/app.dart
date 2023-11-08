import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shop_app_auth/domains/store_repository/store_repository.dart';
import 'package:shop_app_auth/modules/app/cubit/app_cubit.dart';
import 'package:shop_app_auth/modules/app/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_auth/ui_kit/ui_kit.dart' as U;

class App extends StatelessWidget {
//
  final StoreRepository storeRepo;

  const App({
    super.key,
    required this.storeRepo,
  });

  @override
  Widget build(BuildContext context) {
//
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: storeRepo,
        ),
      ],
      child: BlocProvider(
        create: (context) => AppCubit(),
        child: OverlaySupport.global(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              canvasColor: U.Theme.background,
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.windows: FadeThroughPageTransitionsBuilder(),
                  TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
                  TargetPlatform.iOS: FadeThroughPageTransitionsBuilder(),
                  TargetPlatform.macOS: FadeThroughPageTransitionsBuilder(),
                  TargetPlatform.linux: FadeThroughPageTransitionsBuilder(),
                },
              ),
            ),
            builder: (context, child) {
              var width = MediaQuery.of(context).size.width;
              late double temp;
              switch (width) {
                case <= 480:
                  temp = width;
                  break;
                case > 480 && <= 720:
                  temp = width * 0.95;
                  break;
                case > 720:
                  temp = width * 0.90;
                  break;
                default:
              }
              return ResponsiveScaledBox(width: temp, child: child!);
            },
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
      ),
    );
  }
}
