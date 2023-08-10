import 'package:e_commerce/ItemPage/ItemPage.dart';
import 'package:e_commerce/LoginPage/login_page.dart';
import 'package:e_commerce/ShopPage/ShopPage.dart';
import 'package:e_commerce/services/Offer/get_books.dart';
import 'package:flutter/material.dart';
// import 'package:foire_au_livre/login.dart';
// import 'package:foire_au_livre/pages/BookStore/book_grid.dart';
// import 'package:foire_au_livre/pages/BookStore/menu.dart';
// import 'package:foire_au_livre/pages/Wish/wishlist.dart';
// import 'package:foire_au_livre/pages/user_book_page.dart';
// import 'package:foire_au_livre/services/Offer/get_books.dart';
import 'package:get_storage/get_storage.dart';


Widget drawer(context){
  return Drawer(
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        child: Image.asset(
                  'assets/images/logo_transparent.png',
                  width: 250,
                ),
      ),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Accueil'),
        onTap: () {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const ShopPage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.sell),
        title: const Text('Vendre mes livres'),
        onTap: () {
          var user = GetStorage().read('foire_aux_livre_user');
          // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => UserBook(idUser: user['id'],)));
        },
      ),
      ListTile(
        leading: const Icon(Icons.shopping_cart),
        title: const Text('Acheter des livres'),
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>   ItemPage(fetch: getBook('1','100'),title: 'Livres à vendre',)));
          // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BookGrid(fetch: getBook('1','100'),)));
        },
      ),
      ListTile(
        leading: const Icon(Icons.favorite),
        title: const Text('Liste de souhait'),
        onTap: () {
          var user = GetStorage().read('foire_aux_livre_user');
          // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => WishList(idUser: user['id'],)));
        },
      ),
      Positioned( bottom : 10, child : ListTile(
        leading: const Icon(Icons.exit_to_app),
        title: const Text('Déconnection'),
        textColor: Colors.red,
        onTap: () {
          GetStorage().remove('foire_aux_livre_user');
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
        },
      ),)
    ],
  ),
);
}