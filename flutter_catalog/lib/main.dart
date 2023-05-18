import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'learnings/1.modelClass.dart';
import 'pages/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 186, 57, 57),
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
          )
          // fontFamily: GoogleFonts.lato().fontFamily,
          ),
      // initialRoute: MyRoutes.loginRoute,
      routes: {
        // "/": (context) => MyHomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => MyHomePage()
      },
      home: ModelClass(),
      // home: const MyHomePage(),
    );
  }
}
