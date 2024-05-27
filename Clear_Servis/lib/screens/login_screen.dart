import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../providers/auth_provider.dart'; // Импортируем AuthProvider
import '../screens/email_login_screen.dart';
import '../screens/phone_login_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  Future<void> _signInWithFacebook() async {
    try {
      setState(() {
        isLoading = true;
      });

      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final userData = await FacebookAuth.instance.getUserData();

        // Отправьте данные в ваш AuthProvider
        await Provider.of<AuthProvider>(context, listen: false).signInWithFacebook(accessToken, userData);
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        print('Ошибка входа через Facebook: ${result.status}');
      }
    } catch (e) {
      print('Ошибка: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      setState(() {
        isLoading = true;
      });

      final googleUser = await Provider.of<AuthProvider>(context, listen: false).signInWithGoogle();
      if (googleUser != null) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        print('Ошибка входа через Google');
      }
    } catch (e) {
      print('Ошибка: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Приветствуем вас в Clear Servis'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, EmailLoginScreen.routeName);
              },
              child: Text('Продолжить через электронную почту/телефон'),
            ),
            ElevatedButton(
              onPressed: _signInWithGoogle,
              child: Text('Войти через Google'),
            ),
            ElevatedButton(
              onPressed: _signInWithFacebook,
              child: Text('Войти через Facebook'),
            ),
          ],
        ),
      ),
    );
  }
}
