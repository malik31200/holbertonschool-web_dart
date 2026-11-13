
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String?> printRmCharacters() async {
  try {
    String? url = 'https://rickandmortyapi.com/api/character';

    while (url != null) {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode != 200) {
        throw Exception('HTTP error: ${response.statusCode}');
      }

      final data = jsonDecode(response.body);

      final characters = data['results'];

      for (int i = 0; i < characters.length; i++) {
        print(characters[i]['name']);
      }

      url = data['info']['next'];

      if (url != null) {
        await Future.delayed(
          const Duration(milliseconds: 500),
        );
      }
    }

    return null;
  } catch (error) {
    return 'error caught: $error';
  }
}
