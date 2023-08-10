import 'package:e_commerce/LoginPage/components/my_button.dart';
import 'package:e_commerce/LoginPage/components/my_textfield.dart';
import 'package:e_commerce/ShopPage/ShopPage.dart';
import 'package:e_commerce/SplashPage/HomePage.dart';
import 'package:e_commerce/Utils/colors.dart';
import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/services/login.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginBodyScreen extends StatefulWidget {
  const LoginBodyScreen({super.key});

  @override
  State<LoginBodyScreen> createState() => _LoginBodyScreenState();
}

class _LoginBodyScreenState extends State<LoginBodyScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool chargement = false;
  void signUserIn() async {
            setState(() {
              chargement = true;
            });
            
            login(email: emailController.text, mdp: passwordController.text).then((val) => {
              setState(() {
              chargement = false;
              if(!val[0]){
                chargement = false;
                showErrorMessage(val[1].toString());
              }else{
                GetStorage().write('foire_aux_livre_user', User.fromJson(val[2][0]));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const ShopPage()));
              }
            })
            });
          }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }
  Future<void> _launchUrl() async {
  if (!await launchUrl(Uri.parse('https://www.7cortex.com/7cortexintegration/7goto/register.php'))) {
    throw Exception('Could not launch url');
  }
}


  String _errorMessage = "";


  @override
  Widget build(BuildContext context) {
    return chargement ? Container(
      color: Colors.white,
      child: const Center(child: CircularProgressIndicator()),
    ) : SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Cprimary,
        body: ListView(
          padding: const EdgeInsets.fromLTRB(0, 400, 0, 0),
          shrinkWrap: true,
          reverse: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      // height: 535,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: HexColor("#ffffff"),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Se connecter",
                              style: GoogleFonts.poppins(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: HexColor("#4f4f4f"),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: HexColor("#8d8d8d"),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  MyTextField(
        
                                    controller: emailController,
                                    hintText: "mon email 7goto",
                                    obscureText: false,
                                    prefixIcon: const Icon(Icons.mail_outline),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    child: Text(
                                      _errorMessage,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Mot de passe",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: HexColor("#8d8d8d"),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  MyTextField(
                                    controller: passwordController,
                                    hintText: "**************",
                                    obscureText: true,
                                    prefixIcon: const Icon(Icons.lock_outline),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  MyButton(
                                    onPressed: signUserIn,
                                    buttonText: 'Se connecter',
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Connectez-vous avec vos accès 7goto",
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: HexColor("#8d8d8d"),
                                            )),
                                            
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("si vous n'en avez pas",
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: HexColor("#8d8d8d"),
                                            )),
                                            TextButton(
                                              child: Text(
                                                'Inscrivez-vous ici',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: Colors.blueAccent,
                                                ),
                                              ),
                                              onPressed: () => _launchUrl()
                                              ),
                                          ],
                                        ),
          
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -300),
                      child: Image.asset(
                        'assets/images/logo_transparent.png',
                        scale: 1.5,
                        width: double.infinity,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}