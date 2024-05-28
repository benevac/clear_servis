import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle user registration
              },
              child: const Text('Register as User'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Housekeeper Registration
                Navigator.of(context).pushNamed('/register-housekeeper');
              },
              child: const Text('Register as Housekeeper'),
            ),
          ],
        ),
      ),
    );
  }
}
