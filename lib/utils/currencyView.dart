import 'package:currency_app/dataHandle/serviceData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurrencyView extends StatelessWidget {
  CurrencyView({this.currency, this.icon});
  String currency;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 66,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(icon),
                SizedBox(
                  height: 5,
                ),
                Text(currency),
              ],
            ),
            currencyData != null
                ? Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 7,
                        ),
                        Text(symbolsData[currency].toString()),
                        SizedBox(
                          height: 30,
                        ),
                        Spacer(),
                        Text(
                          currencyData[currency].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        FaIcon(FontAwesomeIcons.euroSign),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  )
                : Text("loading"),
          ],
        ),
      ),
    );
  }
}
