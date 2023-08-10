class User {
  String? groupe;
  String? email;
  String? id;
  String? societe;
  String? idSociete;
  String? idGroupe;
  String? idPays;
  String? nom;
  String? entete1;
  String? basdepage;
  String? prenoms;
  String? portable;
  String? telephone;

  User(
      {this.groupe,
      this.email,
      this.id,
      this.societe,
      this.idSociete,
      this.idGroupe,
      this.idPays,
      this.nom,
      this.entete1,
      this.basdepage,
      this.prenoms,
      this.portable,
      this.telephone});

  User.fromJson(Map<String, dynamic> json) {
    groupe = json['groupe'];
    email = json['email'];
    id = json['id'];
    societe = json['societe'];
    idSociete = json['id_societe'];
    idGroupe = json['id_groupe'];
    idPays = json['id_pays'];
    nom = json['Nom'];
    entete1 = json['entete1'];
    basdepage = json['basdepage'];
    prenoms = json['Prenoms'];
    portable = json['Portable'];
    telephone = json['Telephone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['groupe'] = groupe;
    data['email'] = email;
    data['id'] = id;
    data['societe'] = societe;
    data['id_societe'] = idSociete;
    data['id_groupe'] = idGroupe;
    data['id_pays'] = idPays;
    data['Nom'] = nom;
    data['entete1'] = entete1;
    data['basdepage'] = basdepage;
    data['Prenoms'] = prenoms;
    data['Portable'] = portable;
    data['Telephone'] = telephone;
    return data;
  }
}