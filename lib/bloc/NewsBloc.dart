import 'dart:async';

import 'package:flutter_architecture/constant/Constants.dart';
import 'package:flutter_architecture/model/News.dart';
import 'package:flutter_architecture/model/news_response.dart';
import 'package:flutter_architecture/repository/news_repository.dart';

class NewsBloc{
  final _newsRepository = NewsRepository();
  final _newsController = StreamController<List<News>>();
  Stream<List<News>> get newsStream => _newsController.stream.asBroadcastStream();

  _addNews(List<News> newsList){
    _newsController.sink.add(newsList);
  }

  fetchNews() async{
    NewsResponse response = await _newsRepository.fetchNews();
    if(response.status == API_SUCCESS){
      _addNews(response.articles);
    }
  }
}