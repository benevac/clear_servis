import 'package:flutter/material.dart';
import '../models/review.dart';

class ReviewWidget extends StatelessWidget {
  final Review review;

  const ReviewWidget({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.account_circle, size: 40),
      title: Text('${review.userName} (${review.rating})'),
      subtitle: Text(review.comment),
    );
  }
}
