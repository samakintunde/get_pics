import 'package:flutter/material.dart';
import 'dart:convert';
// import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http show Response, get;

import 'package:get_pics/models/image.dart';
import 'package:get_pics/widgets/image_list.dart';
import 'package:get_pics/widgets/image_grid.dart';

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
  int _count = 0;
  List<ImageModel> images = <ImageModel>[];
  String _orientation = 'list';

  // @override
  // void initState() {
  //   super.initState();
  // }

  Future<void> _fetchImage() async {
    _count++;

    final http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/photos/$_count');

    final ImageModel data = ImageModel.fromJson(jsonDecode(response.body));

    setState(() {
      images.add(data);
    });
  }

  // Widget _renderImage() {
  //   if (_orientation == 'grid') {
  //     return GridView.builder(
  //       itemCount: images.length,
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 3,
  //         crossAxisSpacing: 8.0,
  //         mainAxisSpacing: 8.0,
  //       ),
  //       itemBuilder: (BuildContext context, int index) {
  //         return Image.network(images[index]['url']);
  //       },
  //     );
  //   } else {
  //     return ListView.builder(
  //       itemCount: images.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           margin: const EdgeInsets.symmetric(vertical: 4.0),
  //           child: Image.network(images[index]),
  //         );
  //       },
  //     );
  //   }
  // }

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
                images.clear();
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _fetchImage(),
      ),
      body: _orientation == 'list' ? ImageList(images) : ImageGrid(images),
    );
  }
}
