// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/DetailPage/detail_page.dart';
import 'package:e_commerce/Utils/image.dart';
import 'package:e_commerce/Widget/not_found.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class NewProducts extends StatefulWidget {
  
  Future fetch ; 
  NewProducts({
    super.key,
    required this.fetch,
  });

  @override
  State<NewProducts> createState() => _NewProductsState();
}





class _NewProductsState extends State<NewProducts> {
  @override
  var loaded = false;
  var books = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    books = await widget.fetch;
    setState(() {
      loaded = true;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    if(loaded == false){
      return  Container(
      color: Colors.white,
      child: const Center(child: CircularProgressIndicator()),
    );
    }
    if(books.length == 0){
      return  const Center(
              child: ArticleNotFound()
              
            );
    }
    return  Column(
      children: List.generate(
        books.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Details( book: books[index])));
            },
          child: Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 0,
                  bottom: 20,
                  left: 30,
                  right: 30,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(getAllImage(books[index]['photos'])[0] ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 0,
                  bottom: 20,
                  left: 30,
                  right: 30,
                ),
                padding: const EdgeInsets.only(
                    left: 15, right: 12, bottom: 15, top: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.35),
                      Colors.black.withOpacity(0.18),
                      Colors.black.withOpacity(0.05),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        books[index]['titre'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
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
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        books[index]['prix'].toString() + 'F cfa',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35,
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
                                    ],
                                  ),
                                ],
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
