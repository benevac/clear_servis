import 'package:flutter/material.dart';

class PhoneLoginScreen extends StatelessWidget {
  static const routeName = '/phone-login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вход через телефон'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Имя'),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Номер телефона',
                prefixText: '+420',
              ),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Проверочный код'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Создайте пароль'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Логика регистрации через телефон
              },
              child: Text('Зарегистрироваться'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Уже являетесь членом сообщества? Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
