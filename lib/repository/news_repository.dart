import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_architecture/model/News.dart';
import 'package:flutter_architecture/model/news_response.dart';

class NewsRepository{

  Future<NewsResponse> fetchNews() async{
    await Future.delayed(Duration(seconds: 2));
    var response = await rootBundle.loadString("json_response/news_response.json");
    var parsedResponse = NewsResponse.fromJson(jsonDecode(response));
    return parsedResponse;
  }

}