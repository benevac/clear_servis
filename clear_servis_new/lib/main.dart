import 'package:flutter/material.dart';
import 'package:clear_servis/registration_by_email.dart';
import 'package:clear_servis/registration_by_phone.dart';
import 'your_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 80.0, // Уменьшено на 150 пикселей
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/AppBar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              color: Colors.black,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/italki_logo.png', height: 200),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        _showRegistrationOptions(context);
                      },
                      child: Text('Продолжить через электронную почту/телефон'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRegistrationOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Выберите способ регистрации'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.email),
                title: Text('По электронной почте'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrationByEmailPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('По телефону'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrationByPhonePage()));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
