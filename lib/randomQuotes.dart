import 'package:flutter/material.dart';

class randomQuotes extends StatefulWidget {
  const randomQuotes({super.key});

  @override
  State<randomQuotes> createState() => _randomQuotesState();
}

class _randomQuotesState extends State<randomQuotes> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Random"),);
  }
}