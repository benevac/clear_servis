import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import '../models/housekeeper.dart';

class WebScraper {
  Future<List<Housekeeper>> fetchHousekeepers() async {
    final url = Uri.parse('https://www.hlidacky.cz/uklid-domacnosti/1-praha');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      List<Housekeeper> housekeepers = [];

      var elements = document.getElementsByClassName('sitters-list-item');
      for (var element in elements) {
        final id = element.attributes['data-id'] ?? 'unknown';
        final firstName = element.querySelector('.name')?.text ?? 'No name';
        final lastName = '';
        final city = 'Prague';
        final country = 'Czech Republic';
        final imageUrl = element.querySelector('.sitter-image')?.attributes['src'] ?? '';
        final rating = 4.5; // Placeholder rating
        final availableDates = ['2024-05-26', '2024-05-27']; // Placeholder dates

        housekeepers.add(Housekeeper(
          id: id,
          firstName: firstName,
          lastName: lastName,
          city: city,
          country: country,
          imageUrl: imageUrl,
          rating: rating,
          availableDates: availableDates,
        ));
      }

      return housekeepers;
    } else {
      throw Exception('Failed to load housekeepers');
    }
  }
}
