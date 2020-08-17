import 'networking.dart';

const apiKey = 'http://sentimental-analysis-api.herokuapp.com/';

class AnalysisModel {
  Future<dynamic> getAnalysis(String textData) async{
    var url = '$apiKey?text=$textData';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var reviewData = networkHelper.getData();
    return reviewData;
  }
}