import 'dart:convert';
import '../Clients/order_client.dart';
import '../Models/order.dart';


class OrdersRepo {
  OrderClient client = OrderClient();

  Future<List<Order>> getOrders(userId) async {
    var response = await client.getOrdersById(userId);
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Order>((json) => Order.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<Order>> getOrdersByMail(email) async {
    var response = await client.getOrdersByEmail(email);
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Order>((json) => Order.fromMap(json)).toList();
    }
    return [];
  }
}
