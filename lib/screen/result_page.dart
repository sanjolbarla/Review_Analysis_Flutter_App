import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:sentiment_analysis/constants.dart';
import 'package:sentiment_analysis/components/reuseable_card.dart';
import 'package:sentiment_analysis/services/get_analysis.dart';

class Result extends StatefulWidget {
  Result({this.resultData, this.textData});
  final resultData;
  final String textData;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  AnalysisModel analysisModel = AnalysisModel();

  String result;
  String data;

  @override
  void initState() {
    super.initState();
    update(widget.resultData);
  }

  void update(dynamic reviewData) {
    setState(() {
      result = reviewData['result'];
      data = widget.textData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF3E5158),
        elevation: 20,
        title: Center(
          child: Row(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_left,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'Review Analysis',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: kBackgroundColor,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'Your Result',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.white
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReuseableCard(
                colour: Colors.white,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '"$data"',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF848484),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      result,
                      style: kNumberTextStyle.copyWith(
                        fontSize: 70.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

