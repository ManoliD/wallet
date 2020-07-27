import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dio/dio.dart';
import 'package:e_wallet/BankPageScreen/bank_page_screen.dart';
import 'package:e_wallet/models/bank.dart';
import 'package:e_wallet/models/coin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:e_wallet/models/bank.dart';
import '../BankInfoScreen/bank_info_screen.dart';

class BankPage extends StatefulWidget {
  @override
  _BankPageState createState() => _BankPageState();

}

class _BankPageState extends State<BankPage> {

  List<Bank> list = [];

  Future<List<Bank>> BanksAvailable() async {
    Response response;
    Dio dio = new Dio();
    response =
    await dio.get("http://60106d01af44.ngrok.io/banks/bank/?format=json");
//    print('am luat datele');
//    print(response.data.toString());

    for (var element in response.data["results"]) {
      Bank bank = Bank(
          element["id"],
          element["registered_name"],
          element["short_name"],
          element["website"]);
      // sau Bank bank = Bank.fromMap(element);
      print(bank.registered_name);
      list.add(bank);
    }
    return list;
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.lightGreen[600],
        appBar: AppBar(
          backgroundColor: Color(0xFF558B2F),
          title: Center(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text("Bank page",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))
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
        body: Center(
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: BanksAvailable(),
                builder: (BuildContext context, AsyncSnapshot snapShot) {
                  if (snapShot.data == null) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Expanded(
                      child: SizedBox(
                        height: 200.0,
                        child: ListView.builder(
                          // aici faci lista ta si datele tale se aduna in snapShot
                          itemCount: snapShot.data.length, // aici specifici cate elemente ai in lista
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Card(
                                      color: Colors.transparent,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffE1E9E5),
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.blue,
                                                Colors.yellowAccent,
                                              ],
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                7),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text(
                                                      // ca sa iai datele, nu iti treb widget.ceva
                                                      // prosta snapShot.ce vrei
                                                      // specifici sa iai dupa index, ca ai lista
                                                      snapShot.data[index].registered_name, // el iti ia automat aici index si incrementeaza index
                                                      // pt fiecare element
                                                      // asa faci si pentru restul
                                                      // succes :D
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17,
                                                        fontFamily: 'RobotMono',
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text(
                                                      snapShot.data[index].short_name,
                                                      // todo
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontFamily: 'RobotMono',
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text(
                                                      snapShot.data[index].website, // todo
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontFamily: 'RobotMono',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => BankInfoPage(snapShot.data[index].id)));
                                                },
                                                child: ColorizeAnimatedTextKit(
                                                  // navigator catre pagina de cursuri pentru banca x cand apesi pe banca x, (onTap/ onPressed)
                                                    repeatForever: true,
                                                    text: [
                                                      "Cursul Valutar",
                                                    ],
                                                    textStyle: TextStyle(
                                                        fontSize: 25,
                                                        fontFamily: "Horizon"),
                                                    colors: [
                                                      Colors.white,
                                                      Colors.black,
                                                      Colors.black,
                                                      Colors.white,
                                                    ],
                                                    textAlign: TextAlign.start,
                                                    alignment: AlignmentDirectional
                                                        .topStart // or Alignment.topLeft
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ));
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      );
    }
  }

