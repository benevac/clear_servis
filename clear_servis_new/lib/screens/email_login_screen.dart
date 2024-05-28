import 'package:flutter/material.dart';

class EmailLoginScreen extends StatelessWidget {
  static const String routeName = '/emailLogin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вход через электронную почту'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Имя',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Электронная почта',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Создайте пароль',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Действие при нажатии на кнопку зарегистрироваться
              },
              child: Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}
