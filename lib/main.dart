import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'screen/input_page.dart';

void main() => runApp(SentimentAnalysis());

class SentimentAnalysis extends StatefulWidget {
  @override
  _SentimentAnalysisState createState() => _SentimentAnalysisState();
}

class _SentimentAnalysisState extends State<SentimentAnalysis> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}


