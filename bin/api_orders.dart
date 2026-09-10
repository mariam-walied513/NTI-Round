
import 'package:dio/dio.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: "https://nti-ecommerce-api-production-896c.up.railway.app/api",
  ),
);
Future<String> login(String email, String password) async {
  Response response = await dio.post(
    "/login",
    data: FormData.fromMap({
      "email": email,
      "password": password,
    }),
  );
  return response.data['access_token'] ?? response.data['token'];
}


Future<Response> placeOrder(Map<String, dynamic> requestData, String token) async {
  return await dio.post(
    "/place_order",
    data: requestData, // JSON Data
    options: Options(
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    ),
  );
}

// 3. إلغاء طلب (Cancel Order)
Future<Response> cancelOrder(int orderId, String token) async {
  return await dio.post(
    "/orders/cancel/$orderId",
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
}


Future<Response> completeOrder(int orderId, String token) async {
  return await dio.post(
    "/orders/complete/$orderId",
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
}


Future<Response> getOrders(String token) async {
  return await dio.get(
    "/orders",
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
}

void main() async {
  Map<String, dynamic> orderData = {
    "items": [
      {"product_id": 3, "quantity": 2},
      {"product_id": 2, "quantity": 3}
    ]
  };

  try {
    
    String token = await login("mariam_task@gmail.com", "ma67890");
    print("New Active Token: $token\n");

  
    Response placeRes = await placeOrder(orderData, token);
    print("1. Place Order Response: ${placeRes.data}");

    Response getOrdersRes = await getOrders(token);
    print("2. Get Orders Response: ${getOrdersRes.data}");

    Response cancelRes = await cancelOrder(1, token);
    print("3. Cancel Order Response: ${cancelRes.data}");

    Response completeRes = await completeOrder(3, token);
    print("4. Complete Order Response: ${completeRes.data}");

  } on DioException catch (e) {
    print("DioException Error: ${e.response?.data ?? e.message}");
  } catch (e) {
    print("General Error: $e");
  }
}