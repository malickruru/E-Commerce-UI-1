// ignore_for_file: file_names
import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/DetailPage/detail_page.dart';
import 'package:e_commerce/Utils/image.dart';
import 'package:e_commerce/services/Offer/get_books.dart';
import 'package:flutter/material.dart';

class Categoris extends StatefulWidget {
  final double width;
  final double height;

  const Categoris(
      {super.key,
      required this.width,
      required this.height,
      });

  @override
  State<Categoris> createState() => _CategorisState();
}

class _CategorisState extends State<Categoris> {
  @override
  var books ;
  var loaded = false;
void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    books = await getBook('1', '3');

    setState(() {
      loaded = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return !loaded ? Text('chargement ...') : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            3,
            (index) => GestureDetector(
              onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Details( book: books[index])));
            },
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    width: widget.width,
                    height: widget.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(getAllImage(books[index]['photos'])[0] ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    width: widget.width,
                    height: widget.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.35),
                          Colors.black.withOpacity(0.15),
                          Colors.black.withOpacity(0.001),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 12, left: 10),
                          child: Text(
                            books[index]['titre'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                              shadows: [
                                Shadow(
                                  blurRadius: 2,
                                  color: Colors.white.withOpacity(0.7),
                                  offset: const Offset(0, 0),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
