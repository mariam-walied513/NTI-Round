// import 'dart:async';
// import 'dart:core';

import'package:dio/dio.dart';

final Dio dio = Dio();


Future<Response > register(Map<String,dynamic>requestData) async{
  return await dio.post("https://nti-ecommerce-api-production-896c.up.railway.app/api/register",
     data:FormData.fromMap(requestData)

  );
     
}

Future<Response> login(Map<String,dynamic> requestData) async{
  return await dio.post("https://nti-ecommerce-api-production-896c.up.railway.app/api/login",
    data:FormData.fromMap(requestData)
  );
}
Future<Response> updateProfile(Map<String,dynamic> requestData) async{
  return await dio.put("https://nti-ecommerce-api-production-896c.up.railway.app/api/update_profile",
    data:FormData.fromMap(requestData),
    options: Options(
      headers: {
        "Authorization":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODk4MjI0MywianRpIjoiMTEyMDg4OTYtNDgwMy00NzU1LWI2NTYtN2ViNTcyM2QwZTU0IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MTEsIm5iZiI6MTc4ODk4MjI0MywiY3NyZiI6IjQyYzdjNjE5LWY4ZGYtNDQ5OC04YmQ1LTQ2ZDFiODA1MWM5OSIsImV4cCI6MTc4ODk4MzE0M30.Rkv1X4Ll7txXPCZjCwXiMBw1hwJfxOAgOPap9st5hKw."
      }
    )
  );
  }
  Future<Response> getData(Map<String,dynamic> requestData) async{
  
    return await dio.get("https://nti-ecommerce-api-production-896c.up.railway.app/api/get_user_data",
        data:FormData.fromMap(requestData),
        options: Options(
          headers: {
            "Authorization":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODk4MjI0MywianRpIjoiMTEyMDg4OTYtNDgwMy00NzU1LWI2NTYtN2ViNTcyM2QwZTU0IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MTEsIm5iZiI6MTc4ODk4MjI0MywiY3NyZiI6IjQyYzdjNjE5LWY4ZGYtNDQ5OC04YmQ1LTQ2ZDFiODA1MWM5OSIsImV4cCI6MTc4ODk4MzE0M30.Rkv1X4Ll7txXPCZjCwXiMBw1hwJfxOAgOPap9st5hKw"
          }
        )


    );

    
  }
  Future<Response> delete(Map<String,dynamic> requestData) async{
    return await dio.delete("https://nti-ecommerce-api-production-896c.up.railway.app/api/delete_user",
        data:FormData.fromMap(requestData),
        options: Options(
          headers: {
            "Authorization":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODk4MjI0MywianRpIjoiMTEyMDg4OTYtNDgwMy00NzU1LWI2NTYtN2ViNTcyM2QwZTU0IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MTEsIm5iZiI6MTc4ODk4MjI0MywiY3NyZiI6IjQyYzdjNjE5LWY4ZGYtNDQ5OC04YmQ1LTQ2ZDFiODA1MWM5OSIsImV4cCI6MTc4ODk4MzE0M30.Rkv1X4Ll7txXPCZjCwXiMBw1hwJfxOAgOPap9st5hKw"
          }
        )
    );
  }
void main() async{
  Map<String,dynamic> requestData={
    "name":"mariam walied",
    "password": "ma67890",
    "email":"mariam_test100@gmail.com",
    "phone":"01204678888",

  };

  try {
    Response regist = await register(requestData);
    print("Register Success: ${regist.data}");

     
    Response loginA = await login(requestData);
    String token = loginA.data['access_token']; 
    print("Token: $token");
    print(await updateProfile(requestData ));
    print(await getData(requestData));
    print(await delete(requestData));

  }
   on DioException catch (e) {
    print("  DioException: ${e.message}");
   }


}