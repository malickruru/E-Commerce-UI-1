import 'dart:convert';
import 'package:dio/dio.dart';


uploadImages( files) async {
  List<MultipartFile> formDataList = [];

  for (var file in files) {
    String fileName = file.path.split('/').last;
    MultipartFile formData = await MultipartFile.fromFile(file.path, filename: fileName);
    formDataList.add(formData);
  }

  return formDataList;
}

Future addBooks( formData, String id) async {
  final dio = Dio();

var images = await  uploadImages(formData['photos']);

  var postData = FormData.fromMap({
          'photos[]':  images,
          'titre': formData['titre'],
          'prix': formData['prix'],
          'isbn': formData['isbn'],
          'type': formData['type'],
          'matiere': formData['matiere'],
          'nom_vendeur': formData['nom_vendeur'],
          'tel_vendeur': formData['tel'],
          'id_vendeur': id,
        });

    print(images);

  try {
    var response = await dio.request(
  'https://production.7develop.com/api/offre',
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