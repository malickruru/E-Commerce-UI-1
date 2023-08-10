getAllImage(String images){
List<String> fileList = images.split(',');

  fileList = fileList.map((file) => 'https://production.7develop.com/black-opal-ecommerce/photos/$file').toList();

  return fileList;
}