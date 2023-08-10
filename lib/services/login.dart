import 'package:dio/dio.dart';

Future login({required String email, required String mdp}) async {
  final dio = Dio();
  Response response;
  
  response = await dio.get('https://www.7cortex.com/dev/7goto/api/login.php?username=$email&password=$mdp');
  if (response.statusCode == 200) {
     return response.data.values.toList();
  }else{
    
    return response.data.message;
  }
 
}