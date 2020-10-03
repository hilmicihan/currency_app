import 'package:currency_app/dataHandle/serviceData.dart';
import 'package:currency_app/utils/currencyView.dart';
import 'package:currency_app/utils/lastUpdateView.dart';
import 'package:currency_app/utils/searchView.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Timer timer;
  int counter = 0;
  void startData() async {
    await getData();
    await getSymbols();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => addValue());
    startData();
  }

  void addValue() {
    setState(() {
      counter++;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Currency Tracker"),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchCurrency());
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        Text(
                          "Last Updated",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        LastUpdateView(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            CurrencyView(
              currency: "USD",
              icon: FontAwesomeIcons.dollarSign,
            ),
            CurrencyView(
              currency: "JPY",
              icon: FontAwesomeIcons.yenSign,
            ),
            CurrencyView(
              currency: "TRY",
              icon: FontAwesomeIcons.liraSign,
            ),
            FloatingActionButton(
                child: Icon(Icons.refresh),
                onPressed: () {
                  addValue();
                  print(counter);
                })
          ],
        ),
      ),
    );
  }
}
