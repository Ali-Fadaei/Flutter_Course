import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_app_packages/domains/store_repository/store_repository.dart';
import 'package:shop_app_packages/modules/app/cubit/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_packages/modules/app/router.dart';

// import 'package:shop_app_routing/ui_kit/ui_kit.dart' as U;

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
          // initialRoute: HomePage.route,
          // // routes: {
          // //   '/home': (context) => const HomePage(),
          // //   '/apage': (context) => const APage(),
          // //   '/bpage': (context) => const BPage(id: 5),
          // // },
          // onGenerateRoute: (settings) {
          //   switch (settings.name) {
          //     case HomePage.route:
          //       return MaterialPageRoute(
          //         settings: settings,
          //         builder: (context) {
          //           return const HomePage();
          //         },
          //       );

          //     case APage.route:
          //       return MaterialPageRoute(
          //         settings: settings,
          //         builder: (context) {
          //           return const APage();
          //         },
          //       );
          //     case BPage.route:
          //       return MaterialPageRoute(
          //         settings: settings,
          //         builder: (context) {
          //           return BPage(id: settings.arguments as int);
          //         },
          //       );
          //     default:
          //       return MaterialPageRoute(
          //         settings: const RouteSettings(name: HomePage.route),
          //         builder: (context) {
          //           return const HomePage();
          //         },
          //       );
          //   }
          // },
        ),
      ),
    );
  }
}
