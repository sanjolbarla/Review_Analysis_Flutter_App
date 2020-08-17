import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sentiment_analysis/services/get_analysis.dart';
import 'package:sentiment_analysis/constants.dart';
import 'package:sentiment_analysis/screen/result_page.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({this.textData});
  final String textData;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  AnalysisModel analysisModel = AnalysisModel();
  @override
  void initState() {
    super.initState();
    getAnalysisData();
  }

  void getAnalysisData() async{
    var reviewData = await analysisModel.getAnalysis(widget.textData);
    await Navigator.push(context, MaterialPageRoute(builder: (context){
      return Result(resultData: reviewData,textData: widget.textData,);
    }));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: kBackgroundColor,
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
