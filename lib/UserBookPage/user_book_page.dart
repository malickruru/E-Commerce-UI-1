import 'package:e_commerce/ItemPage/components/NewProducts.dart';
import 'package:e_commerce/ShopPage/components/CategoryTitle.dart';
import 'package:e_commerce/Widget/app_bar.dart';
import 'package:e_commerce/Widget/drawer.dart';
import 'package:e_commerce/services/Offer/user_book.dart';
import 'package:flutter/material.dart';

class UserBookPage extends StatefulWidget {
  UserBookPage({super.key,required idUser});
  var idUser;

  @override
  State<UserBookPage> createState() => _UserBookPageState();
}

class _UserBookPageState extends State<UserBookPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: searchAppBar(context: context,color: Colors.black),
      body: ListView(
        children: [
          CategoryTitle(title: 'Mes livres', buttonText: "", link: (){}
),
          NewProducts(
            fetch:  userBook(widget.idUser),
          )
        ],
      ),
    );
  }
}