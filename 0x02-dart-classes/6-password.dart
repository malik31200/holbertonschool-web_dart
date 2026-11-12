class Password {
    String _password = "";

    Password({required String password})
    : _password = password;

    bool isValid() {
        if (_password.length >= 8 && _password.length <= 16 && RegExp(r'[A-Z]').hasMatch(_password) && RegExp(r'[a-z]').hasMatch(_password) && RegExp(r'[0-9]').hasMatch(_password)) {
            return true;
        } else {
            return false;
        }
    }

    @override
        String toString() {
            return "Your Password is: ${_password}";
        }

    String get password {
        return _password;
    }

    set password(String value) {
        _password = value;
    }
}

extend class User(Password) {
    int id;
    String name;
    int age;
    double height;

    User({
        required this.id,
        required this.name,
        required this.age,
        required this.height
    });

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
            id: userJson['id'],
            name: userJson['name'],
            age: userJson['age'],
            height: userJson['height']

        );
    }

    @override
    String toString() {
        return "User(id : $id ,name: $name, age: $age, height: $height)";
    }
}
