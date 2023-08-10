import 'package:e_commerce/Utils/image.dart';
import 'package:e_commerce/Widget/app_bar.dart';
import 'package:e_commerce/Widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  final book;
  const Details({super.key,required this.book});

  @override
  Widget build(BuildContext context) {
     var photo = getAllImage(book['photos']);
    return Scaffold(
      appBar: searchAppBar(context: context,color: Colors.black),
      drawer: drawer(context),
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(
            height: 350,
            child: Swiper(
        itemBuilder: (BuildContext context,int index){
            return Image.network(photo[index],);
        },
        itemCount: photo.length,
        autoplay: true,
            
      ),),
      const SizedBox(height: 45),
      Text(
        book['article_vendu'] == 0 ? 'Article Disponible' : 'Offre expirée',
        textAlign: TextAlign.start,
        style: GoogleFonts.poppins(
          fontSize: 15,
          color: book['article_vendu'] == 0 ? Colors.green : Colors.red,
        ),
      ),
      const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                book['titre'],
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                book['prix'].toString() + 'F cfa',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'IBSN : ' + book['isbn'].toString(),
            textAlign: TextAlign.start,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 45),

          InkWell(
                onTap: () {
                  openContactAppWithNumber(book['tel_vendeur'],context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    
                  ),
                  child: Text(
                            'Appeler le vendeur',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ))),
      ],
      
          ),
    ));
  }
}



void openContactAppWithNumber(String phoneNumber , context) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    Clipboard.setData(ClipboardData(text: phoneNumber));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Numéro copié dans le presse papier')),
    );
  }
}