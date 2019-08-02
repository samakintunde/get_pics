import 'package:flutter/material.dart';
import 'package:get_pics/models/image.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid(this.images);

  final List<ImageModel> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
      child: GridView.builder(
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final ImageModel image = images[index];
          return Image.network(image.url);
        },
      ),
    );
  }
}
