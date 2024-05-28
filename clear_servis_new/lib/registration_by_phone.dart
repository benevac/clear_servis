import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class RegistrationByPhonePage extends StatefulWidget {
  @override
  _RegistrationByPhonePageState createState() => _RegistrationByPhonePageState();
}

class _RegistrationByPhonePageState extends State<RegistrationByPhonePage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _smsCodeController = TextEditingController();
  bool _isSmsSent = false;
  String _initialCountryCode = 'RU';

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      setState(() {
        _initialCountryCode = placemarks.first.isoCountryCode ?? 'RU';
      });
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _smsCodeController.dispose();
    super.dispose();
  }

  void _sendSmsCode() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSmsSent = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('SMS code sent')),
      );
    }
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration successful')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация по телефону')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntlPhoneField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Контактный телефон',
                ),
                initialCountryCode: _initialCountryCode,
                onChanged: (phone) {
                  // Optionally handle phone number changes here
                },
                validator: (value) {
                  if (value == null || value.number.isEmpty) {
                    return 'Пожалуйста, введите номер телефона';
                  }
                  return null;
                },
              ),
              if (_isSmsSent)
                TextFormField(
                  controller: _smsCodeController,
                  decoration: InputDecoration(labelText: 'Код из SMS'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите код из SMS';
                    }
                    return null;
                  },
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isSmsSent ? _register : _sendSmsCode,
                child: Text(_isSmsSent ? 'Зарегистрироваться' : 'Получить код'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
