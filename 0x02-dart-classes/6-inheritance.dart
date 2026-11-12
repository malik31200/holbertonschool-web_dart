import '6-password.dart';

class User extends Password {
    int id;
    String name;
    int age;
    double height;

    User({
        required this.id,
        required this.name,
        required this.age,
        required this.height,
        required String user_password
    }) : super(password: user_password);

    Map<String, dynamic> toJson() {
        return {
            "id": this.id,
            "name": this.name,
            "age": this.age,
            "height": this.height
        };
    }

    static User fromJson(Map<dynamic, dynamic> userJson) {
        return User(
            id: userJson['id'] ?? 0,
            name: userJson['name'] ?? '',
            age: userJson['age'] ?? 0,
            height: userJson['height'] ?? 0.0, 
            user_password: userJson['user_password']
        );
    }

    @override
    String toString() {
        return "User(id : $id ,name: $name, age: $age, height: $height, Password: ${isValid()})";
    }

    set user_password(String value) {
        password = value;
    }

    String get user_password {
        return password;
    }
}
