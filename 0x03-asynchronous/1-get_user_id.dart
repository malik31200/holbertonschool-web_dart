import '1-util.dart';
import 'dart:convert';

Future<String> getUserId() async {
    final idFetch = await fetchUserData();
    final response = jsonDecode(idFetch);
    
    final userId = response['id'];

    return userId;
}
