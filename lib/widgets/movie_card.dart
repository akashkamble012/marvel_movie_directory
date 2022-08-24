import 'package:flutter/material.dart';
import 'package:marvel_movie_directory/core/app_colors.dart';

class PosterWidget extends StatelessWidget {
  final String imageUrl;

  const PosterWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Image.network(
      imageUrl,
      height: size.height * 0.3,
      // width: size.width * 0.40,
    );
  }
}
