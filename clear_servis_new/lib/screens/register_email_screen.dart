import 'package:flutter/material.dart';

class RegisterEmailScreen extends StatelessWidget {
  static const String routeName = '/register_email';

  const RegisterEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Зарегистрироваться'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('по почте', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Имя'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Электронная почта'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Создайте пароль'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Зарегистрироваться'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Уже являетесь членом сообщества? Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
