import 'package:e_commerce/ItemPage/ItemPage.dart';
import 'package:e_commerce/Widget/app_bar.dart';
import 'package:e_commerce/Widget/drawer.dart';
import 'package:e_commerce/services/Offer/get_books.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/Utils/matiere.dart';

class CategoryPage extends StatefulWidget {
  
  
  CategoryPage({
    super.key,
   
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  
  var books = listeMatieres  ;
 
  @override
  Widget build(BuildContext context) {
  
    return  Scaffold(
      appBar: searchAppBar(color: Colors.black , context: context, title: 'Matière'),
      drawer: drawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            books.length,
            (index) => GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>   ItemPage(fetch: categoryBook(books[index].titre),title: books[index].titre,)));
                },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 0,
                  bottom: 20,
                  left: 30,
                  right: 30,
                ),
                decoration: BoxDecoration(
                      color: books[index].couleur,
                      borderRadius: BorderRadius.circular(15),
                    ),
                child: Text(
                books[index].titre,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 3,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.white
                          .withOpacity(0.7),
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
