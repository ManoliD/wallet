class Coin {

  int id;
  String name;
  // ignore: non_constant_identifier_names
  String abbr;
  String bank;
  // ignore: non_constant_identifier_names
  double rate_sell;
  // ignore: non_constant_identifier_names
  double rate_buy;


  Coin(this.id, this.name, this.abbr, this.bank,
      );

  Coin.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        abbr = json['abbr'],
        bank = json['bank'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'abbr': abbr,
      'bank': bank,

    };
  }

  Coin.fromMap(Map<String, dynamic> maps) {
    this.id = maps['id'];
    this.name = maps['name'];
    this.abbr = maps['abbr'];
    this.bank = maps['bank'];

  }
}
