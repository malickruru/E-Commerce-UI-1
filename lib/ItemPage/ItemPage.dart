// ignore_for_file: file_names
import 'package:e_commerce/ItemPage/components/ItemTop.dart';
import 'package:e_commerce/ItemPage/components/NewProducts.dart';
import 'package:e_commerce/ShopPage/components/CategoryTitle.dart';
import 'package:e_commerce/Widget/app_bar.dart';
import 'package:e_commerce/Widget/drawer.dart';
import 'package:e_commerce/services/Offer/get_books.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  
  final String title;

   Future fetch ;
   ItemPage({
    super.key,
    required this.fetch,
    required this.title,
    
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: searchAppBar(context: context,color: Colors.black),
      body: ListView(
        children: [
          CategoryTitle(title: title, buttonText: "", link: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>   ItemPage(fetch: getBook('1','100'),title: 'Livres à vendre',)))
),
          NewProducts(
            fetch: fetch,
          )
        ],
      ),
    );
  }
}
