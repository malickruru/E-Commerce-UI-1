
import 'package:e_commerce/Utils/colors.dart';
import 'package:e_commerce/WishListPage/wish_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ArticleNotFound extends StatelessWidget {
  const ArticleNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Image.asset(
            'assets/images/undraw_Page_not_found_re_e9o6.png',
            fit: BoxFit.cover,
            height: 250,
            width: 250,
          ),
          SizedBox(height: 20,),
          const Positioned(
            bottom: 260,
            left: 100,
            child: Text(
              'Aucun livre trouvé  =(',
              style: kTitleTextStyle,
            ),
          ),
          SizedBox(height: 20,),
          const Positioned(
            bottom: 190,
            left: 50,
            child: Text(
              'ajoutez ce livre à votre liste de souhait et nous vous recontacterons lorsqu\'il sera disponible',
              style: kSubtitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ),SizedBox(height: 20,),
          Positioned(
            bottom: 120,
            left: 130,
            right: 130,
            child: ReusablePrimaryButton(
              childText: 'Ajouter',
              buttonColor: Cprimary,
              childTextColor: Colors.white,
              onPressed: () {
                var user = GetStorage().read('foire_aux_livre_user');
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => WishList(idUser: user['id'],)));
              },
            ),
          ),
        ],
    );
  }
}

const kTitleTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 25,
  letterSpacing: 1,
  fontWeight: FontWeight.w500,
);

const kSubtitleTextStyle = TextStyle(
  color: Colors.black38,
  fontSize: 16,
  letterSpacing: 1,
  fontWeight: FontWeight.w500,
);


class ReusablePrimaryButton extends StatelessWidget {
  const ReusablePrimaryButton({
    Key? key,
    required this.childText,
    required this.onPressed,
    required this.buttonColor,
    required this.childTextColor,
  }) : super(key: key);

  final String childText;
  final Function onPressed;
  final Color buttonColor;
  final Color childTextColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed as VoidCallback,
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: buttonColor,
        ),
        child: Center(
            child: Text(
          childText.toUpperCase(),
          style: TextStyle(
            fontSize: 16,
            color: childTextColor,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}