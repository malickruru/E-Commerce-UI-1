import 'package:flutter/material.dart';

class Matiere {
  String titre;
  Color couleur;

  Matiere(this.titre, this.couleur);
}

List<Matiere> listeMatieres = [
    Matiere('Français', Colors.blue),
    Matiere('Anglais', Colors.red),
    Matiere('Espagnol', const Color.fromARGB(255, 180, 164, 27)),
    Matiere('Allemand', Colors.green),
    Matiere('Mathématique', Colors.orange),
    Matiere('Physique-chimie', Colors.purple),
    Matiere('Science et vie de la terre', Colors.brown),
    Matiere('Histoire géographie', Colors.grey),
    Matiere('Philosophie', Colors.pink),
    Matiere('Musique', Colors.cyan),
    Matiere('Science économique', Colors.blueAccent),
    Matiere('Art plastique', Color.fromARGB(255, 89, 255, 0)),
    Matiere('Informatique', Colors.indigo),
    Matiere('Management', Colors.teal),
    Matiere('Autre', Colors.black),
  ];