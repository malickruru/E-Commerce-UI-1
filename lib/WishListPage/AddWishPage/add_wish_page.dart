import 'package:e_commerce/Utils/colors.dart';
import 'package:e_commerce/WishListPage/wish_list_page.dart';
import 'package:e_commerce/services/Wish/get_wishes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_storage/get_storage.dart';

class AddWish extends StatefulWidget {
  const AddWish({super.key});

  @override
  _AddWishState createState() => _AddWishState();
}

class _AddWishState extends State<AddWish> {
  var loaded = false;
   final _formKey = GlobalKey<FormBuilderState>();
   

  @override
  Widget build(BuildContext context) {
    var user = GetStorage().read('foire_aux_livre_user');
    
    void Navigate() {                     
     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => WishList(idUser: user['id'],)));
        }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cprimary,
        title: const Text('Ajouter un livre à votre liste de souhait'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'titre',
                  decoration: const InputDecoration(labelText: 'Titre'),
                  validator: FormBuilderValidators.required( errorText: 'Ce champ est requis')
                ),
                FormBuilderTextField(
                  name: 'isbn',
                  decoration: const InputDecoration(labelText: 'ISBN'),
                  validator: FormBuilderValidators.required( errorText: 'Ce champ est requis'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  
                  onPressed: () async {
                    setState(() {
                      loaded = true;
                    });
                    var v = _formKey.currentState?.validate();
                    if (v == true) {
                      await addWish( _formKey.currentState?.instantValue , user['id'],"${user['Prenoms']} ${user['Nom']}");
                      Navigate();
                    }else{
                      return ; 
                    }
                    
                    },
                  child: const Text('Ajouter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}