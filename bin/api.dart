import 'package:dio/dio.dart';


void main() async{
  Dio dio=Dio();
  Map<String,dynamic> requestData={
    "username":"mariam01",
    "password":"ma7890"};
    var response=await dio.post("https://ntitodo-production-cddf.up.railway.app/api/login",data:FormData.fromMap(requestData) );
         
         print(response.toString());
    }

