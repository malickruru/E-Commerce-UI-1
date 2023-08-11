import 'package:e_commerce/ItemPage/ItemPage.dart';
import 'package:e_commerce/Utils/colors.dart';
import 'package:e_commerce/services/Offer/add_books.dart';
import 'package:e_commerce/services/Offer/user_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_storage/get_storage.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  var loaded = false;
   final _formKey = GlobalKey<FormBuilderState>();
   

  @override
  Widget build(BuildContext context) {
    var user = GetStorage().read('foire_aux_livre_user');
    
    void Navigate() {                     
     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ItemPage(fetch: userBook(user['id']),title: 'Mes livres',userOption: true,)));
        }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un livre'),
        backgroundColor: Cprimary,
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
                FormBuilderDropdown(
                  name: 'type',
                  decoration: const InputDecoration(labelText: 'Type'),
                  items: ['Manuel', 'Roman'].map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
                  validator: FormBuilderValidators.required( errorText: 'Ce champ est requis')
                ),
                FormBuilderDropdown(
                  name: 'matiere',
                  decoration: const InputDecoration(labelText: 'Matière'),
                  items: [
                    'Français',
                    'Anglais',
                    'Espagnol',
                    'Allemand',
                    'Mathématique',
                    'Physique-chimie',
                    'Science et vie de la terre',
                    'Histoire géographie',
                    'Philosophie',
                    'Musique',
                    'Science économique',
                    'Art plastique',
                    'Informatique',
                    'Management',
                    'Autre',
                  ].map((matiere) => DropdownMenuItem(value: matiere, child: Text(matiere))).toList(),
                  validator:  FormBuilderValidators.required( errorText: 'Ce champ est requis'),
                ),
                FormBuilderImagePicker(
                  name: 'photos',
                  decoration: const InputDecoration(labelText: 'Photos'),
                  maxImages: 20,
                ),
                FormBuilderTextField(
                  initialValue: "${user['Prenoms']} ${user['Nom']}" ,
                  name: 'nom_vendeur',
                  decoration: const InputDecoration(labelText: 'Nom du vendeur'),
                  validator: FormBuilderValidators.required( errorText: 'Ce champ est requis'),
                ),
                FormBuilderTextField(
                  name: 'tel',
                  decoration: const InputDecoration(labelText: 'Téléphone'),
                  validator: FormBuilderValidators.required(errorText: 'Ce champ est requis'),
                ),FormBuilderTextField(
                  name: 'prix',
                  decoration: const InputDecoration(labelText: 'Prix'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Ce champ est requis'),
                    FormBuilderValidators.numeric(),
                  ]
                )),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      loaded = true;
                    });
                    var v = _formKey.currentState?.validate();
                    if (v == true) {
                      await addBooks( _formKey.currentState?.instantValue , user['id']);
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

