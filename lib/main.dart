import 'package:flutter/material.dart';
import 'package:flutter_testing/models/favorites.dart';
import 'package:flutter_testing/screens/favourites.dart';
import 'package:flutter_testing/screens/home.dart';
import 'package:provider/provider.dart';
import "package:flutter_driver/driver_extension.dart";

void main() {
  enableFlutterDriverExtension();
  runApp(TestingApp());
}

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          FavoritesPage.routeName: (context) => FavoritesPage(),
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
