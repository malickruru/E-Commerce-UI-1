import 'package:dio/dio.dart';

Future getBook( page , item) async {
  final dio = Dio();
  Response response;
  
  response = await dio.get('${'https://production.7develop.com/api/offres/'+page}/'+item);
  if (response.statusCode == 200) {
    
    return response.data['data'];
  }else{
    return response.data.message;
  }
}

Future searchBook( search) async {
  final dio = Dio();
  Response response;
  
  response = await dio.get('https://production.7develop.com/api/recherche/offres/'+search);
  if (response.statusCode == 200) {
    return response.data['data'];
  }else{
    return response.data.message;
  }
}

Future categoryBook( category) async {
  final dio = Dio();
  Response response;
  
  response = await dio.get('https://production.7develop.com/api/matiere/offres/'+category);
  if (response.statusCode == 200) {
    return response.data['data'];
  }else{
    return response.data.message;
  }
}