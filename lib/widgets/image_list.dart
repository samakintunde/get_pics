import 'package:flutter/material.dart';
import 'package:get_pics/models/image.dart';
import 'package:get_pics/widgets/image_card.dart';

class ImageList extends StatelessWidget {
  const ImageList(this.images);

  final List<ImageModel> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32.0),
      child: ListView.builder(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          final ImageModel image = images[index];
          return ImageCard(image.url, image.title);
        },
      ),
    );
  }
}
