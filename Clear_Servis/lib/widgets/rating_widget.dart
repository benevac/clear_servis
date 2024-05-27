import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;

  const RatingWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$rating', style: TextStyle(fontSize: 18)),
        Icon(Icons.star, color: Colors.yellow),
      ],
    );
  }
}
