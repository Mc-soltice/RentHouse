import 'package:flutter/material.dart';
import 'package:renthouse/screens/home/home_screen.dart';
import 'package:renthouse/components/navigation_menu/navigation_menu.dart';
// import 'package:renthouse/screens/login/login_screen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: MyHomePage(
          title: 'Welcome to RentHouse',
        ),
        bottomNavigationBar: NavigationMenu(),
      ),
    );
  }
}


