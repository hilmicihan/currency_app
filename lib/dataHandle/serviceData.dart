import 'dart:convert';
import 'package:http/http.dart' as http;

var currencyData;
DateTime timeData;
var symbolsData;
var currencyKeyData;
void getData() async {
  const String url =
      "http://data.fixer.io/api/latest?access_key=cc35a9863c9b2270ec05624ca2049d73";

  http.Response response = await http.get(url);
  if (response.statusCode != 200) {
    print("Take data cause a problem");
    return;
  }
  var others = jsonDecode(response.body);
  if (others["success"] != true) {
    print("Take data cause a problem");
    return;
  }
  var currencies = jsonDecode(response.body)["rates"];
  var timestamp = others["timestamp"];
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  currencyData = currencies;
  currencyKeyData = currencies.keys;
  timeData = date;
  /* 
  print(currencies);
  print(timeData);
  print("status code:" + response.statusCode.toString());
  print(others["success"].runtimeType); */
}

void getSymbols() async {
  const String url =
      "http://data.fixer.io/api/symbols?access_key=cc35a9863c9b2270ec05624ca2049d73";

  http.Response response = await http.get(url);
  if (response.statusCode != 200) {
    print("Take data cause a problem");
    return;
  }
  symbolsData = jsonDecode(response.body)["symbols"];
}
