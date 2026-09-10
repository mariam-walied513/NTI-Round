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


Future<Response> newProducts(Map<String, dynamic> requestData, String token) async {
  return await dio.post(
    "/new_product",
    data: FormData.fromMap(requestData), // JSON Data
    options: Options(
      headers: {
       
        "Authorization": "Bearer $token",
      },
    ),
  );
}


Future<Response> addToFavorite( String token) async {
  return await dio.post(
    "/add_to_favorite",
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
}


Future<Response> editProduct(int orderId, String token) async {
  return await dio.put(
    "/product/$orderId",
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
}


Future<Response> deleteProducts( int productId,String token) async {
  return await dio.delete(
    "/product",
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
}
Future<Response> getProducts(String token) async {
  return await dio.get(
    "/products",
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
}
Future<Response> search(String token) async {
  return await dio.get(
    "/products/search?q=p",
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
}
Future<Response> bestSellerProducts(String token) async {
  return await dio.get(
    "/best_seller_products",
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
}
Future<Response> topSellerProducts(String token) async {
  return await dio.get(
    "/top_rated_products",
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
}



void main() async {
  Map<String, dynamic> orderData = {
    "name":"new test pr",
    "description":"product 1 description",
    "rating":"4.5",
    "price":"80",
    "best_seller":"1",
    "category_id":"2"
      
  };

  try {
    
    String token = await login("mariam_task@gmail.com", "ma67890");
    print("New Active Token: $token\n");

  
    Response placeRes = await newProducts(orderData, token);
    print("1. Place Order Response: ${placeRes.data}");

    Response addto = await addToFavorite(token);
    print("2. Get Orders Response: ${addto.data}");

    Response edit = await editProduct(3, token);
    print("3. Cancel Order Response: ${edit.data}");

    Response delete = await deleteProducts( 3,token);
    print("4. Complete Order Response: ${delete.data}");

    Response getProductsRes = await getProducts(token);
    print("5. Get Products Response: ${getProductsRes.data}");

    Response searchRes = await search(token);
    print("6. Search Products Response: ${searchRes.data}");

    Response bestSellerRes = await bestSellerProducts(token);
    print("7. Best Seller Products Response: ${bestSellerRes.data}");
     
    Response topSellerRes = await topSellerProducts(token);
    print("8. Top Seller Products Response: ${topSellerRes.data}");

  }

   on DioException catch (e) {
    print("DioException Error: ${e.response?.data ?? e.message}");
  } catch (e) {
    print("General Error: $e");
  }
}