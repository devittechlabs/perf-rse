

List<UserModel> listUserModelFromJson(List usersList) => List<UserModel>.from(
    usersList.map((indicateur) => UserModel.fromJson(indicateur))
);

class UserModel {

  UserModel({
    this.id,
    this.collectionId,
    this.createdAt,
    this.databaseId,
    this.updatedAt,
    this.accesAudit,
    this.accesReporting,
    this.addresse,
    this.avatar,
    this.email,
    this.estBloque,
    this.fonction,
    this.titre,
    this.langue,
    this.nom,
    this.numeroTel,
    this.pays,
    this.prenom,
    this.theme,
    this.ville,
  });

  final String? id;
  final String? collectionId;
  final DateTime? createdAt;
  final String? databaseId;
  final DateTime? updatedAt;
  final String? accesAudit;
  final String? accesReporting;
  final String? email;
  final String? nom;
  final String? titre;
  final String? prenom;
  final bool? estBloque;
  String? addresse;
  String? avatar;
  String? fonction;
  String? langue;
  String? numeroTel;
  String? pays;
  String? theme;
  String? ville;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["\u0024id"],
    collectionId: json["\u0024collectionId"],
    createdAt: DateTime.parse(json["\u0024createdAt"]),
    databaseId: json["\u0024databaseId"],
    updatedAt: DateTime.parse(json["\u0024updatedAt"]),
    accesAudit: json["acces_audit"],
    accesReporting: json["acces_reporting"],
    addresse: json["addresse"],
    titre: json["titre"],
    avatar: json["avatar"],
    email: json["email"],
    estBloque: json["est_bloque"],
    fonction: json["fonction"],
    langue: json["langue"],
    nom: json["nom"],
    numeroTel: json["numero_tel"],
    pays: json["pays"],
    prenom: json["prenom"],
    theme: json["theme"],
    ville: json["ville"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "\u0024collectionId": collectionId,
    "\u0024createdAt": createdAt.toString(),
    "\u0024databaseId": databaseId,
    "\u0024updatedAt": updatedAt.toString(),
    "acces_audit": accesAudit,
    "acces_reporting": accesReporting,
    "addresse": addresse,
    "avatar": avatar,
    "email": email,
    "est_bloque": estBloque,
    "fonction": fonction,
    "langue": langue,
    "nom": nom,
    "numero_tel": numeroTel,
    "pays": pays,
    "prenom": prenom,
    "theme": theme,
    "titre":titre,
    "ville": ville,
  };
}

