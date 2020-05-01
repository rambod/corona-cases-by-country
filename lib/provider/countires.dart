import 'package:flutter/material.dart';
import '../models/country.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Countries with ChangeNotifier {
  List _items = [];
  List _countriesInfo = [];
  List _totalz = [{'totalConfrimed': 0,'totalDeath':0,'totalRecover':0}];


  List get countriesInfo {
    return [..._countriesInfo];
  }

  List get totalz{
    return [..._totalz];
  }

  List get items {
    return [..._items];
  }

  Future<Null> httpGet() async {
    final http.Response response =
        await http.get('https://www.trackcorona.live/api/countries');

    final List dt = await json.decode(response.body)['data'];
    print(dt[0]);
    _items = dt;
    int sumConfirmed = 0;
    int sumDeath = 0;
    int sumRecoved = 0;
    for (var i in dt){
      sumConfirmed +=  i['confirmed'];
      sumDeath +=  i['dead'];
      sumRecoved +=  i['recovered'];
    }
    _totalz = [{'totalConfrimed': sumConfirmed,'totalDeath':sumDeath,'totalRecover':sumRecoved}];

        print(sumConfirmed);
        print(sumDeath);
        print(sumRecoved);
    notifyListeners();
  }
  
  Future<Null> fetchCountriesInfo() async {
    final http.Response responseCountryInfo = await http.get('url');
  }
}
