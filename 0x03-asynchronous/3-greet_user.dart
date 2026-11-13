import '3-util.dart';
import 'dart:convert';

Future<String> greetUser() async {
    try {
        final user = await fetchUserData();
        final response = jsonDecode(user);
        final userName = response['username'];
        return "Hello $userName";
    } catch (error) {
          return "error caught: $error";
    }
}

Future<String> loginUser() async {
    try {
        final credentials = await checkCredentials();
        if (credentials) {
            print ("There is a user: true");
            return await greetUser();
        } else {
            print ("There is a user: false");
            return "Wrong credentials";
        }
    } catch (error) {
        return "error caught: $error";
    }
}