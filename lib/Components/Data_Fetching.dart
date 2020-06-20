import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Utilities.dart';

class DataFetcher {
  Future<double> requestExchangeRate() async {
    http.Response response = await http.get(
        'https://free.currconv.com/api/v7/convert?q=${topSelectedCurrencyCode}_$bottomSelectedCurrencyCode&compact=ultra&apiKey=2403a9dd5eeeb59060c2');

    double exchangeRate;

    if (response.statusCode == 200) {
      exchangeRate = double.parse((jsonDecode(response.body)[
              '${topSelectedCurrencyCode}_$bottomSelectedCurrencyCode'])
          .toString());
    } else {
      print(response.statusCode);
    }
    return exchangeRate;
  }
}
