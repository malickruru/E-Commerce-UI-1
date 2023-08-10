// ignore_for_file: unused_import

import 'package:e_commerce/LoginPage/login_page.dart';
import 'package:e_commerce/ShopPage/ShopPage.dart';
import 'package:e_commerce/SplashPage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
   await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  
  @override
  Widget build(BuildContext context) {
    var user = GetStorage().read('foire_aux_livre_user');
    

    islogged(){
      if(user != null){
        return const ShopPage();
      }
      return const LoginPage();
    }

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: islogged(),
    );
  }
}
