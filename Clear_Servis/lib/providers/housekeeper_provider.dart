import 'package:flutter/material.dart';
import '../models/housekeeper.dart';
import '../services/web_scraper.dart';

class HousekeeperProvider with ChangeNotifier {
  List<Housekeeper> _housekeepers = [];
  String _cityFilter = '';
  String _countryFilter = '';

  List<Housekeeper> get housekeepers {
    if (_cityFilter.isEmpty && _countryFilter.isEmpty) {
      return _housekeepers;
    }
    return _housekeepers.where((hk) {
      final matchesCity = _cityFilter.isEmpty || hk.city.toLowerCase() == _cityFilter.toLowerCase();
      final matchesCountry = _countryFilter.isEmpty || hk.country.toLowerCase() == _countryFilter.toLowerCase();
      return matchesCity && matchesCountry;
    }).toList();
  }

  void setCityFilter(String city) {
    _cityFilter = city;
    notifyListeners();
  }

  void setCountryFilter(String country) {
    _countryFilter = country;
    notifyListeners();
  }

  Future<void> fetchHousekeepers() async {
    try {
      final scraper = WebScraper();
      _housekeepers = await scraper.fetchHousekeepers();
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
