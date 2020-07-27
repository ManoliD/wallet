class Bank {
  // todo model class cu parametri de pe server pentru bank + constructor
  // daca vrei poti face aici functii pentru toJson si fromJson

  int id;
  String registered_name;
  // ignore: non_constant_identifier_names
  String short_name;
  String website;


  Bank(this.id, this.registered_name, this.short_name, this.website,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'registered_name': registered_name,
      'short_name': short_name,
      'website': website,

    };
  }

  Bank.fromMap(Map<String, dynamic> maps) {
  this.id = maps['id'];
  this.registered_name = maps['registered_name'];
  this.short_name = maps['short_name'];
  this.website = maps['website'];

  }
  }

