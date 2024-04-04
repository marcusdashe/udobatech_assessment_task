import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udobatech_competency_test/ui/dashboard/blog/blog_post_screen.dart';
import 'package:udobatech_competency_test/ui/getstarted/flash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Udoba Tech - Blog Post',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FlashScreen(),

      routes: {
        BlogPostScreen.routeName: (context) => const BlogPostScreen(),
      }
    );
  }
}
