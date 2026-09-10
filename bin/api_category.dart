import 'package:dio/dio.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: "https://nti-ecommerce-api-production-896c.up.railway.app/api",
  ),
);


Future<String> login(String email, String password) async {
  Response response = await dio.post(
    "/login",
    data: FormData.fromMap({"email": email, "password": password}),
  );
  return response.data['access_token'] ?? response.data['token'];
}

Future<Response> newCategory(Map<String, dynamic> data, String token) async {
  return await dio.post(
    "/new_category",
    data: FormData.fromMap(data),
    options: Options(headers: {"Authorization": "Bearer $token"}),
  );
}

Future<Response> getCategories(String token) async {
  return await dio.get(
    "/categories",
    options: Options(headers: {"Authorization": "Bearer $token"}),
  );
}


Future<Response> editCategory(int id, Map<String, dynamic> data, String token) async {
  return await dio.put(
    "/category/$id",
    data: FormData.fromMap(data),
    options: Options(headers: {"Authorization": "Bearer $token"}),
  );
}


Future<Response> deleteCategory(int id, String token) async {
  return await dio.delete(
    "/category/$id",
    options: Options(headers: {"Authorization": "Bearer $token"}),
  );
}

void main() async {
  Map<String, dynamic> categoryData = {
    "title": "cat 2",
    "description":"cat 2 description"
  };

  try {
    String token = await login("mariam_task@gmail.com", "ma67890");


    print(await newCategory(categoryData, token));
    print(await getCategories(token));
    print(await editCategory(1, categoryData, token));
    print(await deleteCategory(1, token));
  } on DioException catch (e) {
    print("Error: ${e.response?.data ?? e.message}");
  }
}