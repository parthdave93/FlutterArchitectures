import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/bloc/NewsBloc.dart';
import 'package:flutter_architecture/model/News.dart';

class NewsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsListState();
  }
}

class _NewsListState extends State<NewsList> {

  NewsBloc _newsBloc;

  @override
  void initState() {
    _newsBloc = NewsBloc();
    super.initState();

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _newsBloc.newsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, pos) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(snapshot.data[pos].content),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Author: ${snapshot.data[pos].author}"),
                      ),
                    ],
                  ),
                );
              }, itemCount: snapshot.data.length,);
          }else if(snapshot.hasError)
            return Center(child: Text(snapshot.error as String));
          else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void fetchData() async {
    _newsBloc.fetchNews();
  }
}