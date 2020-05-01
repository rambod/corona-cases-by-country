import 'dart:ui';
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

  void _search(dt) {
    setState(() {
      _searchword = dt;
    });
    print(_searchword);
  }

  @override
  Widget build(BuildContext context) {
    final countriesData = Provider.of<Countries>(context);
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
            .62,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomRight,
                begin: Alignment.centerLeft,
                colors: [Colors.white, Colors.white]),
            borderRadius: BorderRadius.only(
//              bottomRight: Radius.elliptical(200, 200),
              bottomLeft: Radius.elliptical(
                  MediaQuery.of(context).size.width * .5,
                  MediaQuery.of(context).size.height * .5),
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
                  TextField(
                    autofocus: false,
                    decoration: InputDecoration(
//                      border: Border(InputBorder(borderSide: BorderSide(color: Colors.red))),

                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    onChanged: (val) => _search(val),
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
                                      color: Colors.black26,
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
                                        child: Image(
                                          image: NetworkImage(
                                              'https://www.countryflags.io/${_countries[index]['country_code']}/shiny/64.png'),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        child: Text(
                                          _countries[index]['location'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                      Container(
                                        height: (MediaQuery.of(context)
                                                    .size
                                                    .height -
                                                widget.appBar.preferredSize
                                                    .height -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .top) *
                                            .18,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.deepOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
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
                                                            10)),
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
                                                            10)),
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
                        : Text(
                            'No Data',
                            style: TextStyle(color: Colors.blue),
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
