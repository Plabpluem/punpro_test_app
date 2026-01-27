import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:punpro_test_app/screens/product_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Punpro test",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.deepOrange,
        ),
        textTheme: GoogleFonts.kanitTextTheme(),
      ),
      home: ProductListScreen(),
    );
  }
}
