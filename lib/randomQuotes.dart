import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class randomQuotes extends StatefulWidget {
  const randomQuotes({super.key});

  @override
  State<randomQuotes> createState() => _randomQuotesState();
}

class _randomQuotesState extends State<randomQuotes> {
  String? quotes, author;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            quotes ?? 'Wait...',
            textAlign: TextAlign.center,
          ),
          Text('- ' + (author ?? 'Wait...')),
        ],
      )),
    );
  }

  void _getQuote() async {
    var res = await http.get(Uri.parse("https://api.quotable.io/random"));
    var body = jsonDecode(res.body);

    setState(() {
      quotes = body['content'];
      author = body['author'];
    });
  }
}
