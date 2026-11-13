
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> printRmCharacters() async {
  try {
    // 1. Récupérer la première page pour connaître le nombre total de pages
    final firstUrl = Uri.parse(
      'https://rickandmortyapi.com/api/character',
    );

    final firstResponse = await http.get(firstUrl);

    if (firstResponse.statusCode != 200) {
      throw Exception('HTTP error: ${firstResponse.statusCode}');
    }

    final firstData = jsonDecode(firstResponse.body);
    final pages = firstData['info']['pages'];

    // 2. Parcourir toutes les pages
    for (int page = 1; page <= pages; page++) {
      final url = Uri.parse(
        'https://rickandmortyapi.com/api/character?page=$page',
      );

      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('HTTP error: ${response.statusCode}');
      }

      // 3. Transformer le JSON en données Dart
      final data = jsonDecode(response.body);

      // 4. Récupérer la liste des personnages
      final characters = data['results'];

      // 5. Afficher le nom de chaque personnage
      for (int i = 0; i < characters.length; i++) {
        print(characters[i]['name']);
      }
    }

    return null;
  } catch (error) {
    print('error caught: $error');
  }
}
