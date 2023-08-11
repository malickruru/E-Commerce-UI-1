import 'package:e_commerce/Utils/colors.dart';
import 'package:e_commerce/Widget/app_bar.dart';
import 'package:e_commerce/Widget/drawer.dart';
import 'package:e_commerce/Widget/not_found.dart';
import 'package:e_commerce/WishListPage/AddWishPage/add_wish_page.dart';
import 'package:e_commerce/services/Wish/get_wishes.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class WishList extends StatefulWidget {
  WishList({super.key, required this.idUser});
  var idUser;

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  
  var loaded = false;
  var books = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    
      books = await userWish(widget.idUser);

    setState(() {
      loaded = true;
    });
    
  }
  @override
  Widget build(BuildContext context)  {

     return Scaffold(
      appBar: appBar(title: 'Ma liste de souhait'),
      drawer: drawer(context),
      body: Stack(
        children: [
          // Contenu de la page
          Container(
            color: Colors.white,
            child:  _content(books,loaded,context)
          ),
          // Bouton circulaire
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              backgroundColor: Cprimary,
              onPressed: () {
                // Get.to( AddView());
                Navigator.push(context, MaterialPageRoute(builder: (context) =>   const AddWish()));
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}


Widget _content(books,loaded,context){
    if(loaded == false){
      return  Container(
      color: Colors.white,
      child: const Center(child: CircularProgressIndicator()),
    );
    }
    if(books.length == 0){
      return  Column(
        children: [
          const Text(
              'ici vous pouvez ajouter un livre absent de la plateforme ,Nous vous recontacterons lorsqu\'il sera disponible',
              style: kSubtitleTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
          ReusablePrimaryButton(
                  childText: 'Ajouter un manuel',
                  buttonColor: Cprimary,
                  childTextColor: Colors.white,
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>   const AddWish()));
                  },
                ),
        ],
      );
    }
    return GridView.builder(
        itemCount: books.length,
        physics: const NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 7, crossAxisCount: 1, mainAxisSpacing: 5),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Cligth
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    books[index]['titre'],
                    style: const TextStyle(color: Colors.black87 , fontSize: 25),
                  ),

                  Text(
                    'ISBN : '+ books[index]['isbn'].toString(),
                    style: const TextStyle(color: Colors.black54 ,fontSize: 20),
                  ),
                  Text(
                    'vous rechercher ce livre depuis le '+ DateFormat('EEE dd MMMM y', 'fr_FR').format(DateTime.parse(books[index]['date'].toString())),
                    style: const TextStyle(color: Colors.black45,fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          );
        });
  }