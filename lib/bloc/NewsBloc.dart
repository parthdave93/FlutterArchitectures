import 'dart:async';

import 'package:flutter_architecture/model/News.dart';

class NewsBloc{

  final _newsController = StreamController<List<News>>();
  Stream<List<News>> get newsStream => _newsController.stream;

  addNews(List<News> newsList){
    _newsController.sink.add(newsList);
  }



}