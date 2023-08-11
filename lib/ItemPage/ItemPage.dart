// ignore_for_file: file_names
import 'package:e_commerce/AddBookPage/add_book.dart';
import 'package:e_commerce/ItemPage/components/NewProducts.dart';
import 'package:e_commerce/ShopPage/components/CategoryTitle.dart';
import 'package:e_commerce/Utils/colors.dart';
import 'package:e_commerce/Widget/app_bar.dart';
import 'package:e_commerce/Widget/drawer.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  
  final String title;
  final bool userOption;
   Future fetch ;
   ItemPage({
    super.key,
    required this.fetch,
    required this.title,
    this.userOption = false
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: searchAppBar(context: context,color: Colors.black ),
      body: Stack(
        children: [ListView(
          children: [
            CategoryTitle(title: title, buttonText: "", link: (){}
      ),
            NewProducts(
              fetch: fetch,
            ),
            
          ],
        ),userOptionWidget(context,userOption)]
      ),
    );
  }
}

userOptionWidget (context , display){
  if(display){
    return Positioned(
        right: 16,
        bottom: 16.0,
      child: Column(
      children: [
         FloatingActionButton(
          backgroundColor: Cprimary,
           onPressed: () {
             // Get.to( AddView());
             Navigator.push(context, MaterialPageRoute(builder: (context) =>   const AddBook()));
           },
           child: const Icon(Icons.add),
         ),
         SizedBox(height: 20),
        //  FloatingActionButton(
        //    onPressed: () {
        //      // Get.to( AddView());
        //      // Navigator.push(context, MaterialPageRoute(builder: (context) =>   const WishThread()));
        //    },
        //    child: const Icon(Icons.library_books_outlined),
        //  ),
      ],),
    );
  }
  return const SizedBox(height: 0,);
  
}