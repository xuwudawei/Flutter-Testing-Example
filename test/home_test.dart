import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/models/favorites.dart';
import 'package:flutter_testing/screens/home.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider(
      create: (context) => Favorites(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );

void main() {
  group('Home Page Widgets Testing', () {
    for (int i = 0; i < 10; i++) {
      testWidgets('Testing ListView Scrolling', (tester) async {
        await tester.pumpWidget(createHomeScreen());
        expect(find.byType(ListView), findsOneWidget);
      });

      testWidgets('Testing Scrolling', (tester) async {
        await tester.pumpWidget(createHomeScreen());
        expect(find.text('Item 0'), findsOneWidget);
        await tester.fling(find.byType(ListView), Offset(0, -100), 100);
        await tester.pumpAndSettle();
        expect(find.text('Item 0'), findsNothing);
      });
      testWidgets('Testing IconButtons', (tester) async {
        await tester.pumpWidget(createHomeScreen());
        expect(find.byIcon(Icons.favorite), findsNothing);
        await tester.tap(find.byIcon(Icons.favorite_border).first);
        await tester.pumpAndSettle(Duration(seconds: 1));
        expect(find.text('Added to favorites.'), findsOneWidget);
        expect(find.byIcon(Icons.favorite), findsWidgets);
        await tester.tap(find.byIcon(Icons.favorite).first);
        await tester.pumpAndSettle(Duration(seconds: 1));
        expect(find.text('Removed from favorites.'), findsOneWidget);
        expect(find.byIcon(Icons.favorite), findsNothing);
      });
    }
  });
}
