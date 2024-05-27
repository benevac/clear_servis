import 'package:flutter/material.dart';

class RegisterHousekeeperScreen extends StatelessWidget {
  static const routeName = '/register-housekeeper';

  const RegisterHousekeeperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Housekeeper'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Country'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Available Dates (comma separated)'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle housekeeper registration
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
