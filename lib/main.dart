// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:http/http.dart' as http;

import 'package:get_pics/util/api.dart';

void main(List<String> args) {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Pics',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _imageList;

  String _orientation = 'list';

  @override
  void initState() {
    super.initState();
    _imageList = <String>['$API/400/200'];
    _orientation = 'list';
  }

  Widget _renderImage() {
    if (_orientation == 'grid') {
      return GridView.builder(
        itemCount: _imageList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(_imageList[index]);
        },
      );
    } else {
      return ListView.builder(
        itemCount: _imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            child: Image.network(_imageList[index]),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Pics'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              _orientation == 'grid' ? Icons.view_agenda : Icons.grid_on,
            ),
            tooltip: _orientation,
            onPressed: () {
              setState(() {
                _orientation = _orientation == 'grid' ? 'list' : 'grid';
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _imageList.clear();
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _imageList.add('$API/400/200');
          });
        },
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: _renderImage(),
        // Text('Showing as $_orientation'.toUpperCase()),
      ),
    );
  }
}
