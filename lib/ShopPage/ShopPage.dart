// ignore_for_file: file_names
import 'package:e_commerce/CategoryPage/category_page.dart';
import 'package:e_commerce/Data/Content.dart';
import 'package:e_commerce/ItemPage/ItemPage.dart';
import 'package:e_commerce/ShopPage/components/Categories.dart';
import 'package:e_commerce/ShopPage/components/CategoryTitle.dart';
import 'package:e_commerce/ShopPage/components/Matiere.dart';
import 'package:e_commerce/ShopPage/components/ShopWall.dart';
import 'package:e_commerce/Widget/app_bar.dart';
import 'package:e_commerce/Widget/drawer.dart';
import 'package:e_commerce/services/Offer/get_books.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: searchAppBar(context: context),
      drawer: drawer(context),
      body: Stack(
        children: [
          
          ListView(
            children:  [
              /// this is for showing wall of shop page.
              ShopWall(),

              /// this is for Showing Category Titles.
              CategoryTitle(
                title: "Dernière offres",
                buttonText: "voir plus",
                link: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>   ItemPage(fetch: getBook('1','100'),title: 'Livres à vendre',)));} 
              ),

              /// this is for showing category widget.
              const Categoris(
                height: 170,
                width: 140,
                
              ),

              /// this is for litle margin.
              SizedBox(height: 30),

              /// this is for Showing Category Titles.
              CategoryTitle(
                title: "Matières",
                buttonText: "voir plus",
                link: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>   CategoryPage()));} 
              ),
              const Matiere(
                height: 80,
                width: 170,
              ),
              SizedBox(height: 50),
            ],
          ),Positioned(
          top: 0,
          height: 90,
          left: 0,
          right: 0,
          child: searchAppBar(context: context)
        ),
        ],
      ),
    );
  }
}
