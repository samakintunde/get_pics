import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(this.imageUrl, this.title);

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(0, 6.0),
            blurRadius: 16.0,
            color: Colors.black12,
          )
        ],
      ),
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                imageUrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
