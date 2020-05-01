import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/countires.dart';
import 'package:intl/intl.dart';

class HeadBody extends StatefulWidget {
  final AppBar appBar;

  HeadBody(this.appBar);

  @override
  _HeadBodyState createState() => _HeadBodyState();
}

class _HeadBodyState extends State<HeadBody> {
  String _searchword = '';

  @override
  void initState() {
    print('Start Up');
    // TODO: implement initState
    super.initState();
  }

  void _search(dt) {
    setState(() {
      _searchword = dt;
    });
    print(_searchword);
  }

  @override
  Widget build(BuildContext context) {
    print('Hello world');
    final x = print('Hello world2');
    final countriesData = Provider.of<Countries>(context);
    final countryfetch = countriesData.httpGet;
    final countries = countriesData.items;
    final sumz = countriesData.totalz;
    () => {x};
//    countryfetch();
    void test() {
      countryfetch;
      setState(() {});
    }

    test;

    print(countries);

    var _countries = countriesData.items
        .where((element) => element['location']
            .toLowerCase()
            .contains(_searchword.toLowerCase()))
        .toList();
    var _countries2 = countriesData.items
        .where((element) => element['location'].contains(_searchword))
        .toList();
    final formater = new NumberFormat("###,###,###");
    print(_countries2);

    return ChangeNotifierProvider.value(
      value: Countries(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height -
                widget.appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            .604,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
//              bottomRight: Radius.elliptical(200, 200),
              bottomLeft: Radius.elliptical(
                  MediaQuery.of(context).size.width * .4,
                  MediaQuery.of(context).size.height * .4),
//              topRight:  Radius.elliptical(300, 400),
//              topLeft:  Radius.elliptical(500, 200),
            )),
//        child: Text(countries.isNotEmpty ? countries.toString() : 'No Data'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              height: (MediaQuery.of(context).size.height -
                      widget.appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  .7,

//              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width),
              width: MediaQuery.of(context).size.width * .8,
              child: Container(
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .5,
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * .01),
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
//                      border: Border(InputBorder(borderSide: BorderSide(color: Colors.red))),

                        labelText: 'Search Country Name',
                      ),
                      onChanged: (val) => _search(val),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: (MediaQuery.of(context).size.height -
                            widget.appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        .50,
                    child: _countries.isNotEmpty
                        ? ListView.builder(
                            itemCount: _countries.length,
                            itemBuilder: (
                              ctx,
                              index,
                            ) {
                              return Container(
//                          width: MediaQuery.of(context).size.width * .5,
//                        height: MediaQuery.of(context).size.height * .2,

                                  margin: EdgeInsets.all(1),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .1,
//                                height: MediaQuery.of(context).size.height * .1,
                                        child: Image.asset(
                                            'assets/flags/264-${_countries[index]['location'].toString().toLowerCase().replaceAll(' ', '-')}.png'),
//                                          image: NetworkImage(
//                                              'https://www.countryflags.io/${_countries[index]['country_code']}/shiny/64.png'),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        child: Text(
                                          _countries[index]['location'],
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .12,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.deepOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Icon(Icons.group),
                                                      Text(
                                                        formater
                                                            .format(_countries[
                                                                    index]
                                                                ['confirmed'])
                                                            .toString(),
                                                      ),
                                                    ]),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Icon(Icons.mood_bad),
                                                    Text(formater
                                                        .format(
                                                            _countries[index]
                                                                ['dead'])
                                                        .toString()),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Icon(Icons.mood),
                                                    Text(formater
                                                        .format(
                                                            _countries[index]
                                                                ['recovered'])
                                                        .toString()),
                                                  ],
                                                ),
                                              )
                                            ]),
                                        alignment: Alignment.centerRight,
                                      ),
                                    ],
                                  ));
                            })
                        : Column(
                            children: <Widget>[
                              Text(
                                'No Data',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              RaisedButton(
                                elevation: 20,
                                onPressed: countryfetch,
                                color: Theme.of(context).primaryColor,
                                child: Icon(
                                  Icons.cloud_download,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
