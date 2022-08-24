import 'package:flutter/material.dart';
import 'package:marvel_movie_directory/core/styles.dart';

class BodyWrapper extends StatelessWidget {
  final Widget child;

  const BodyWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.edgeInsetsAll08,
      child: child,
    );
  }
}
