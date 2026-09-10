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


Future<Response> addSlider(Map<String, dynamic> data, String token) async {
  return await dio.post(
    "/new_slider",
    data: FormData.fromMap(data),
    options: Options(headers: {"Authorization": "Bearer $token"}),
  );
}


Future<Response> editSlider(int id, Map<String, dynamic> data, String token) async {
  return await dio.put(
    "/slider/$id",
    data: FormData.fromMap(data),
    options: Options(headers: {"Authorization": "Bearer $token"}),
  );
}


Future<Response> deleteSlider(int id, String token) async {
  return await dio.delete(
    "/slider/$id",
    options: Options(headers: {"Authorization": "Bearer $token"}),
  );
}


Future<Response> getSliders(String token) async {
  return await dio.get(
    "/sliders",
    options: Options(headers: {"Authorization": "Bearer $token"}),
  );
}

void main() async {
  Map<String, dynamic> sliderData = {
    "title": "slider 03 title",
    "description": "slider 02 description",
  };

  try {
    String token = await login("mariam_task@gmail.com", "ma67890");

    
    print(await addSlider(sliderData, token));
    print(await getSliders(token));
    print(await editSlider(1, sliderData, token));
    print(await deleteSlider(1, token));
  } on DioException catch (e) {
    print("Error: ${e.response?.data ?? e.message}");
  }
}