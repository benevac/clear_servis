import 'package:flutter/material.dart';
import '../models/housekeeper.dart';
import '../widgets/calendar_widget.dart';
import '../widgets/rating_widget.dart';
import '../widgets/review_widget.dart';
import '../models/review.dart';

class HousekeeperDetailScreen extends StatelessWidget {
  static const routeName = '/housekeeper-detail';

  @override
  Widget build(BuildContext context) {
    final housekeeper = ModalRoute.of(context)!.settings.arguments as Housekeeper;

    final reviews = [
      Review(
        id: '1',
        housekeeperId: housekeeper.id,
        userId: 'user1',
        userName: 'John Doe',
        rating: 4.5,
        comment: 'Great service!',
      ),
      Review(
        id: '2',
        housekeeperId: housekeeper.id,
        userId: 'user2',
        userName: 'Jane Smith',
        rating: 5.0,
        comment: 'Highly recommended!',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('${housekeeper.firstName} ${housekeeper.lastName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(housekeeper.imageUrl),
            const SizedBox(height: 16),
            Text(
              '${housekeeper.firstName} ${housekeeper.lastName}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('${housekeeper.city}, ${housekeeper.country}'),
            const SizedBox(height: 16),
            RatingWidget(rating: housekeeper.rating),
            const SizedBox(height: 16),
            CalendarWidget(availableDates: housekeeper.availableDates),
            const SizedBox(height: 16),
            const Text('Reviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (ctx, i) => ReviewWidget(review: reviews[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
