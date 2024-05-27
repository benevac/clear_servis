import 'package:flutter/material.dart';

class RegisterPhoneScreen extends StatelessWidget {
  static const String routeName = '/register_phone';

  const RegisterPhoneScreen({Key? key}) : super(key: key);

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
            Text('по телефону', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Имя'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(labelText: '+420'),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Номер телефона'),
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Проверочный код'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('ОТПРАВИТЬ'),
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
