import 'package:e_wallet/models/coin.dart';
import 'package:e_wallet/models/rate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dio/dio.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// ignore: must_be_immutable
class BankInfoPage extends StatefulWidget {
  final int bankID;

  BankInfoPage(this.bankID);

  @override
  _BankInfoPageState createState() => _BankInfoPageState(bankID);
}

class _BankInfoPageState extends State<BankInfoPage> {
  List<Coin> list = [];
  final int bankID;
  List<Coin> availableCoins;
  List<Rate> availableRates;

  _BankInfoPageState(this.bankID);

//  Future<List<Coin>> CoinsAvailable() async {
//    Response response;
//    Dio dio = new Dio();
//    response =
//    await dio.get("http://60106d01af44.ngrok.io/banks/coin/?format=json&page_size=20");
//    print('am luat datele');
////    print(response.data["results"].toString());
//
//    for (var element in response.data["results"]) {
//      Coin coin = Coin.fromMap(element);
//
//      print("Coin name = " + coin.name);
//      list.add(coin);
//    }
//
//    return list;
//  }
//
//  List<Rate> table =[] ;
//  Future<List<Rate>> RatesAvailable() async {
//    Response response;
//    Dio dio = new Dio();
//    response =
//    await dio.get("http://60106d01af44.ngrok.io/banks/coin/?format=json&page_size=20");
//    print('am luat datele');
//
//    for (var element in response.data["results"]) {
//      Rate rate = Rate (
//          element["id"],
//          element["rate_sell"],
//          element["abbr"],
//          element["date"],
//          element["currency"]);
//
//      print(rate.rate_sell.toString());
//
//      table.add(rate);
//    }
//
//    print("dsajdlaa" + table[0].date.toString());
//
//    return table;
//  }

  Future<List<Coin>> AvailableCoins() async {
    Response response;
    Dio dio = new Dio();
    int coinID;
    Rate rate;

    availableCoins = List();
    availableRates = List();

    response = await dio
        .get("http://60106d01af44.ngrok.io/banks/coin/$bankID/?format=json");

    print("am ajuns aici");

    for (var i in response.data["results"]) {
      Coin coin = Coin.fromJson(i);
      print(coin.bank.toString());
      coinID = coin.id;
      print(coinID.toString());
      response = await dio.get(
          "http://60106d01af44.ngrok.io/statistics/live/$coinID/?format=json");
      print(response.data.toString());

      rate = Rate.fromMap(response.data[0]);
      coin.rate_sell = rate.rate_sell;
      coin.rate_buy = rate.rate_buy;
      availableCoins.add(coin);
    }

    print(availableCoins.length.toString());

    return availableCoins;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE1E9E5),
      appBar: AppBar(
        title: Center(
            child: Column(
          children: [
            SizedBox(height: 5),
            Text("Bank Coins",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ],
        )),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(FontAwesomeIcons.user),
            onPressed: () {},
          ),
        ],
        backgroundColor: Color(0xffE1E9E5),
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline5: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Curs valutar",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'RobotMono',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: AvailableCoins(),
                  builder: (BuildContext context, AsyncSnapshot snapShot) {
                    if (snapShot.data == null) {
                      return Align(
                        alignment: Alignment.topCenter,
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return this.cell(snapShot.data);
                    }
                  },
                )
              ],
            ),
          )),
    );
  }

  Widget cell(data) {
    return Expanded(
      child: ListView.builder(
//          controller: scrollController,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xffE1E9E5), Colors.white]),
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Text(
                                data[index].name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontFamily: 'RobotMono',
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                data[index].abbr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontFamily: 'RobotMono',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: TypewriterAnimatedTextKit(
                                  text: [
                                    "Cursul curent",
                                  ],
                                  repeatForever: true,
                                  textStyle: TextStyle(
                                    color: Colors.green,
                                    fontSize: 19,
                                    fontFamily: 'RobotMono',
                                  ),
                                )),
                            Container(
                              child: Text(
                                "Vânzare: " +
                                    data[index].rate_sell.toString() +
                                    " MDL",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontFamily: 'RobotMono',
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Cumpărare: " +
                                    data[index].rate_buy.toString() +
                                    " MDL",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontFamily: 'RobotMono',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ],
                    )));
          }),
    );
  }
}
