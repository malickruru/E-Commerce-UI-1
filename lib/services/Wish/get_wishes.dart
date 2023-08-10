import 'dart:convert';

import 'package:dio/dio.dart';

Future getWish( page , item) async {
  final dio = Dio();
  Response response;
  
  response = await dio.get('${'https://production.7develop.com/api/souhaits/'+page}/'+item);
  if (response.statusCode == 200) {
    
    return response.data['data'];
  }else{
    return response.data.message;
  }
}

Future userWish( id) async {
  final dio = Dio();
  Response response;
  
  response = await dio.get('https://production.7develop.com/api/souhaits/'+id);
  if (response.statusCode == 200) {
    return response.data['data'];
  }else{
    return response.data.message;
  }
}


Future addWish( formData, String id,name) async {
  final dio = Dio();



  var postData = FormData.fromMap({
          'titre': formData['titre'],
          'isbn': formData['isbn'],
          'user_id': id,
          'user_name': name,
        });

  try {
    var response = await dio.request(
  'https://production.7develop.com/api/souhait',
  options: Options(
    method: 'POST',
    followRedirects: false,
    validateStatus: (status) {
          return status! < 500;  
    },
  ),
  data: postData,
);

    if (response.statusCode == 200) {
  print(json.encode(response.data));
  
}else if(response.statusCode == 403){
  print(json.encode(response.data));
}
else {
  print(response.data);
}}catch (e ) {
  print(e);
}

}