import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentiment_analysis/components/reuseable_card.dart';
import 'package:sentiment_analysis/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'loading_screen.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String review;

  String data(String value) {
    String rev = value;
    return rev;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF3E5158),
          elevation: 20,
          title: Center(
            child: Text(
              'Review Analysis',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                      colour: Colors.white,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: kTextFieldInputDecoration,
                            onChanged: (value) {
                              review = value;
                              data(value);
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          GestureDetector(
                            onTap: () async {
                              var connectivity =
                                  await Connectivity().checkConnectivity();
                              if (connectivity == ConnectivityResult.none) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      title: Text('No Internet Access'),
                                      content: Text(
                                          'You\'re not connected to a Network.'),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Close'),
                                        )
                                      ],
                                    );
                                  },
                                );
                              } else {
                                if( review == null) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        title: Text('Empty!!'),
                                        content: Text(
                                            'Please ensure that you have entered the Review.'),
                                        actions: <Widget>[
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Close'),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                }
                                else{
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return LoadingScreen(textData: review);
                                      },
                                    ),
                                  );
                                }
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              width: 200.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF1C5AE2),
                                border: Border.all(width: 0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              child: Center(
                                child: Text(
                                  'CHECK',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
