import 'package:dio/dio.dart';

Future userBook( id) async {
  final dio = Dio();
  Response response;
  
  response = await dio.get('https://production.7develop.com/api/offres/'+id);
  if (response.statusCode == 200) {
    return response.data['data'];
  }else{
    return response.data.message;
  }
 
}