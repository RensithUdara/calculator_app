import 'package:calculator_app/Provider/calculate_provider.dart';
import 'package:calculator_app/Provider/theme_provider.dart';
import 'package:calculator_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CalculateProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final provider = Provider.of<ThemeProvider>(context);

      return MaterialApp(
        themeMode: provider.themeState,
        theme: ThemeData.light(),
        darkTheme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: const Calculator(),
      );
    });
    // const MaterialApp(
    //     // title: 'Flutter Demo',
    //     //
    //     debugShowCheckedModeBanner: false,
    //     home: Calculator());
  }
}
