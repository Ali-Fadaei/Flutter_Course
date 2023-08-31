import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
          builder: (context, child) {
            var width = MediaQuery.of(context).size.width;
            late double temp;
            switch (width) {
              case <= 480:
                temp = width;
                break;
              case > 480 && <= 720:
                temp = width / 1.05;
                break;
              case > 720:
                temp = width / 1.1;
                break;
              default:
            }
            return ResponsiveScaledBox(width: temp, child: child!);
          },
          theme: ThemeData(useMaterial3: true),
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
