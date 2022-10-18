

 import 'package:dio/dio.dart';

class dioHelper{
 static Dio dio =Dio() ;

  static intia(){
    dio =Dio(
      BaseOptions(
        baseUrl:'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      )
    ) ;
  }


  static Future<Response> getData(url , Map<String, dynamic> queres) async{
   return await dio.get(url ,queryParameters: queres);
  }



}