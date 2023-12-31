import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_app_navigator/domains/store_repository/store_repository.dart';
import 'package:shop_app_navigator/modules/app/cubit/app_cubit.dart';
import 'package:shop_app_navigator/modules/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_navigator/modules/profile/a_page.dart';
import 'package:shop_app_navigator/modules/profile/b_page.dart';

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
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
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
          initialRoute: HomePage.route,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case HomePage.route:
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) {
                    return const HomePage();
                  },
                );
              // case CategoryPage.route:
              //   return MaterialPageRoute(
              //     settings: settings,
              //     builder: (context) => CategoryPage(
              //       categoryId: settings.arguments as int,
              //     ),
              //   );
              case APage.route:
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => const APage(),
                );
              case BPage.route:
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => BPage(
                    id: settings.arguments as int,
                  ),
                );
              default:
                return MaterialPageRoute(
                  settings: const RouteSettings(name: HomePage.route),
                  builder: (context) {
                    return const HomePage();
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
