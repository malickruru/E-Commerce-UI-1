import 'package:e_commerce/ItemPage/ItemPage.dart';
import 'package:e_commerce/services/Offer/get_books.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
// import 'package:foire_au_livre/pages/BookStore/book_grid.dart';
// import 'package:foire_au_livre/services/Offer/get_books.dart';

PreferredSizeWidget appBar({String title = ''}){
  return AppBar(backgroundColor: Colors.white,
  shadowColor: Colors.transparent,
  foregroundColor: Colors.black,
  title: Text(title),
  );
}

PreferredSizeWidget searchAppBar({String title = '',context,color = Colors.white}){
  var query = '.';
  return EasySearchBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  foregroundColor: color,
    title: Text(title),
    onSearch: (value) => {
      if(value == query){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>   ItemPage(fetch: searchBook(value),title: 'Résultat pour "${value}" ',)))
      }else{
        query = value
      }
    },
    searchHintText: 'Rechercher un titre ou code ISBN',
  );
  
}