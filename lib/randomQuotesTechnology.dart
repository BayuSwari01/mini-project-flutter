import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class randomQuotesTechnology extends StatefulWidget {
  const randomQuotesTechnology({super.key});

  @override
  State<randomQuotesTechnology> createState() => _randomQuotesTechnologyState();
}

class _randomQuotesTechnologyState extends State<randomQuotesTechnology> {
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
    var res = await http
        .get(Uri.parse("https://api.quotable.io/random?tags=technology"));
    var body = jsonDecode(res.body);

    setState(() {
      quotes = body['content'];
      author = body['author'];
    });
  }
}
