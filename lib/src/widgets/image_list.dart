import 'package:flutter/material.dart';
import '../models/image_model.dart';


class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  const ImageList({super.key, required this.images});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Image.network(image.url),
          ),
          SizedBox(height: 10),
          Text(
            image.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}