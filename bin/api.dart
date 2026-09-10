import 'package:dio/dio.dart';


// void main() async{
//   Dio dio=Dio();
//   Map<String,dynamic> requestData={
//     "username":"mariam01",
//     "password":"ma7890"};
//     var response=await dio.post("https://ntitodo-production-cddf.up.railway.app/api/login",data:FormData.fromMap(requestData) );
         
//          print(response.toString());
//     }


// void main() async {
//   Dio dio = Dio();
//   var response =await dio.get('https://api.openweathermap.org/data/2.5/weather',
//       queryParameters: {
//         'lat':'30.5877893',
//         'lon':'31.4798788',
//         'appid': '39ef56aa87e0f9d833e66cd9111de959',
//         'units':'metric'
// }
// );
//   print(response.data.toString());
// }

// void main() async {
//   Dio dio = Dio();
//   var response = await dio.get('https://newsapi.org/v2/everything',
  
//       queryParameters: {
//         'q':'a',
//         'apiKey':'836086f05b344448a16dd41ee51c6320',
//         'language':"en"}
//         );
//         print(response.data.toString());}



  //       void main() async {
  // Dio dio = Dio();
  // var response = await dio.get('https://newsapi.org/v2/top-headlines',
  
  //     queryParameters: {
  //       'q':'we',
  //       'apiKey':'836086f05b344448a16dd41ee51c6320',
  //       'category':"science"}
  //       );
  //       print(response.data.toString());}
        
void main() async {
  try{
  Dio dio = Dio();
  // Map<String,dynamic> getTaskData ={
  //   "title":"task 01",
  //   "description":"ma"

  // };
  var response = await dio.delete('https://ntitodo-production-cddf.up.railway.app/api/tasks/49',
  options: Options(
    headers: {
      "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODUxOTY5NiwianRpIjoiNGM2YmNhNzYtOTE3OS00YjA5LWFiZDYtMTBjZDNhMTA2Mjk4IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6NTEsIm5iZiI6MTc4ODUxOTY5NiwiY3NyZiI6ImUyMTRmODUxLTI2ZDctNGEzYi04ZjdlLWZlNmFlOTgzNzFmMiIsImV4cCI6MTc4ODUyMDU5Nn0.O-3wrdNInWAmPGzGwI8G-Awz406IKTCgxmErwi-cwqE",
  }
  ),
);
    
  print(response.data.toString());
  }catch(e){
       print(e.toString());
  }
}