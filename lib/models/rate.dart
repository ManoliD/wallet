class Rate {
  // todo model class cu parametri de pe server pentru bank + constructor
  // daca vrei poti face aici functii pentru toJson si fromJson

  int id;
  double rate_sell;
  // ignore: non_constant_identifier_names
  double rate_buy;
  String date;
  int currency;

  Rate(this.id, this.rate_sell, this.rate_buy, this.date,this.currency
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rate_sell': rate_sell,
      'rate_buy': rate_buy,
      'date': date,
      'currency': currency

    };
  }

  Rate.fromMap(Map<String, dynamic> maps) {
    this.id = maps['id'];
    this.rate_sell = maps['rate_sell'];
    this.rate_buy = maps['rate_buy'];
    this.date = maps['date'];
    this.currency = maps['currency'];

  }
}
