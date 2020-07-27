import 'dart:io';

import 'package:e_wallet/BankPageScreen/bank_page_screen.dart';
import 'package:e_wallet/WalletsScreen/wallet_create.dart';

import 'package:e_wallet/models/coin.dart';
import 'package:e_wallet/models/transaction.dart';
import 'package:e_wallet/models/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dio/dio.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() =>
      _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Future<void> functie() async {} // functie care obtine wallets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Column(
          children: [
            SizedBox(height: 10),
            Text("Wallet Page",
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
      drawer: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white, Colors.black])),
        child: Drawer(child: leftMenu()),
      ),
      body: Container(
        color: Color(0xffE1E9E5),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(color: Color(0xffE1E9E5)),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 20,
                                        ),
                                        child: Text(
                                          "WALLET_ID", // todo
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          "Balance: ", //todo
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Value Buy : ", // todo
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Value Sell : ", // todo
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 30),
                                              Column(
                                                children: [
                                                  Text(
                                                    "Profit: ", // todo
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 25,
                                  ),
                                  width: 100,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [Colors.red, Colors.blue],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    FlatButton(
                      child: Text(
                        "Transactions",
                        style:
                        TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        // navigator catre pagina de tranzactii // todo
                      },
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 3),
                            Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Wallet Settings",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(width: 140),
                        Image.network(
                          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmaxcdn.icons8.com%2FShare%2Ficon%2Fnolan%2FFinance%2Fbank_cards1600.png&f=1&nofb=1",
                          width: 50,
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.elliptical(5, 5),
                            right: Radius.elliptical(5, 5))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Add Wallet",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WalletCreate(),
                                    ));
                              },
                            ),
                            SizedBox(height: 20)
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.pink, Colors.deepOrange])),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Make a payment",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 20)
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.green, Colors.yellow])),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 120),
              ],
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.wallet),
            title: Text("Wallet"),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
            title: Text("Account"),
          ),
        ],
        currentIndex: 0,
        onTap: (i) {},
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 20, 0, 100),
      ),
    );
  }

  Widget leftMenu() {
    return ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.white70, Colors.red])),
          child: UserAccountsDrawerHeader(
            accountEmail: Text("emai"),
            accountName: Text("Nume Prenume"),
            currentAccountPicture: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage("https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F1.bp.blogspot.com%2F-8d7Veg4rt70%2FTfiwFu8BlYI%2FAAAAAAAAAF0%2FHpaO4dDBVeg%2Fs1600%2Fprofile-picture.gif&f=1&nofb=1"),
                ),
              ),
            ),
          ),
        ),
        ListTile(
          title: Text("Wallets"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MainScreen()));
          },
        ),
        ListTile(
          title: Text("Banks"),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => BankPage()));
          },
        ),
        ListTile(
          title: Text("Help"),
          onTap: () {},
        ),
      ],
    );
  }

}
