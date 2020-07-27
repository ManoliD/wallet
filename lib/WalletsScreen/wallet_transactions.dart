import 'dart:io';

import 'package:e_wallet/WalletsScreen/transaction_create.dart';
import 'package:e_wallet/models/coin.dart';
import 'package:e_wallet/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletTransactions extends StatefulWidget {

  @override
  WalletTransactionsState createState() => WalletTransactionsState();
}

class WalletTransactionsState extends State<WalletTransactions> {

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
      body: Container(
        child: Column(
          children: [
            FlatButton(
              child: Text(
                "New Transaction",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onPressed: () {
//                createTransaction(walletID);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionsCreate(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
