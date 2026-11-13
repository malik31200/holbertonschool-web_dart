import '4-util.dart';
import 'dart:convert';

Future<double> calculateTotal() async {
    try {
        final user = await fetchUserData();
        final userId = jsonDecode(user);
        final id = userId['id'];
        final orders = await fetchUserOrders(id);
        final products = jsonDecode(orders);
        double total = 0;
        for (int i = 0; i < products.length; i++) {
            final product = products[i];
            final productPrice = await fetchProductPrice(product);
            final price = jsonDecode(productPrice);
            total += price;
        }
        return total;

    } catch (error) {
        return -1;
    }
}