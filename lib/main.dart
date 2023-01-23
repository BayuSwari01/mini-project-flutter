import 'package:flutter/material.dart';
import 'package:mini_project/randomQuotes.dart';
import 'package:mini_project/randomQuotesTechnology.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List pages = [
    randomQuotes(),
    randomQuotesTechnology(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              label: "Random Quotes", icon: Icon(Icons.abc)),
          BottomNavigationBarItem(
              label: "Random Quotes Technology", icon: Icon(Icons.abc)),
        ],
        onTap: onTap,
      ),
    ),
    );
  }
}
