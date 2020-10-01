import 'package:currency_app/dataHandle/serviceData.dart';
import 'package:flutter/material.dart';

var suggestionList = new List();

class SearchCurrency extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Column();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final List<String> suggestionList = new List();
    if (query == "") {
      suggestionList.add("USD");
    } else {
      for (var element in currencyKeyData)
        if (element.toString().toLowerCase().startsWith(query.toLowerCase()))
          suggestionList.add(element);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          for (var element in suggestionList) SearchInfo(currency: element),
        ],
      ),
    );
  }
}

class SearchInfo extends StatelessWidget {
  SearchInfo({this.currency});
  String currency;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              currency,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Text(symbolsData[currency].toString()),
            Spacer(),
            Text(currencyData[currency].toString()),
            Icon(Icons.euro),
          ],
        ),
      ),
    );
  }
}
