import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  static const routeName = '/booking';

  final String housekeeperId;

  const BookingScreen({Key? key, required this.housekeeperId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Display booking information and form here
            ElevatedButton(
              onPressed: () {
                // Handle booking and subscription
                Navigator.of(context).pushNamed('/subscription');
              },
              child: const Text('Book and Subscribe for \$100/month'),
            ),
          ],
        ),
      ),
    );
  }
}
