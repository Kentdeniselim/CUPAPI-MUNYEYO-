import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/login%20provider/signin_provider.dart';
import 'package:praktek2/josh/Provider/login%20provider/signup_provider.dart';
import 'package:praktek2/josh/Provider/time_provider.dart';
import 'package:praktek2/josh/screen/login%20screen/login_screen.dart';
import 'package:provider/provider.dart';
import 'josh/Provider/Bookmarkpro.dart';
import 'josh/Provider/Theme.dart';
import 'josh/Provider/infomation provider/profauna.dart';
import 'josh/Provider/infomation provider/proflora.dart';
import 'josh/Provider/infomation provider/prolake.dart';
import 'josh/Provider/infomation provider/promountain.dart';
import 'josh/Provider/infomation provider/proriver.dart';
import 'josh/screen/navigation.dart';
import 'josh/Provider/navpro.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Prohewan()),
        ChangeNotifierProvider(create: (_) => Proflora()),
        ChangeNotifierProvider(create: (_) => Prolake()),
        ChangeNotifierProvider(create: (_) => Promountain()),
        ChangeNotifierProvider(create: (_) => Proriver()),
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
        ChangeNotifierProvider(create: (_) => ThemePro()),
        ChangeNotifierProvider(create: (_) => Navpro()),
        ChangeNotifierProvider(create: (_) => TimeProvider()),
        ChangeNotifierProvider(create: (_) => SigninProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemePro>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'RimbaFamily',
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData.light().copyWith(
            primaryColor: Colors.green,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.green,
              foregroundColor: Colors.black,
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            primaryColor: Colors.teal,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey[900],
              foregroundColor: Colors.white,
            ),
          ),
          home: MainNavigationpro(),
        );
      },
    );
  }
}
