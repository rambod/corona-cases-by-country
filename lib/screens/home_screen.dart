import '../widget/head_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/countires.dart';
import 'dart:ui';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Size> _heightAnimation;
  final formater = new NumberFormat("###,###,###");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _heightAnimation = Tween<Size>(
            begin: Size(double.infinity, 100), end: Size(double.infinity, 600))
        .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    _heightAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final countriesData = Provider.of<Countries>(context);
    final countries = countriesData.items;
    final sumz = countriesData.totalz;
    final countryfetch = countriesData.httpGet;
    final appBar =  AppBar(title: Text('Covid-19 Tracker'),);

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.blue
//            borderRadius: BorderRadius.all(Radius.circular(30)),
//              gradient: LinearGradient(colors: [
//            Colors.indigo,
//            Colors.indigoAccent,
////            Colors.deepPurple,
////            Colors.teal,
////            Colors.red
//          ], begin: Alignment.bottomRight, end: Alignment.topLeft)
              ),
          child: Column(
            children: [
              HeadBody(appBar),
              Stack(children: [
                Container(
                  width: double.infinity,
                  height: (MediaQuery.of(context).size.height- appBar.preferredSize.height - MediaQuery.of(context).padding.top) * .28,
                  decoration: BoxDecoration(
                    color: Colors.white,

                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height- appBar.preferredSize.height - MediaQuery.of(context).padding.top) * .3,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.elliptical(MediaQuery.of(context).size.width *.5,MediaQuery.of(context).size.height*.5 )),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(5.0, 5.0),
                                  spreadRadius: 2.0,
                                  blurRadius: 10)
                            ]),
                        child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dead',
                                  style: TextStyle(shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0.5, 0.5),
                                        blurRadius: 2)
                                  ]),
                                ),
                                Text(
                                  formater
                                      .format(sumz[0]['totalDeath'])
                                      .toString(),
                                  style: TextStyle(shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0.5, 0.5),
                                        blurRadius: 2)
                                  ]),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(5.0, 5.0),
                                  spreadRadius: 2.0,
                                  blurRadius: 10)
                            ]),
                        child: CircleAvatar(
                            backgroundColor: Colors.deepOrangeAccent,
                            radius: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Confirmed',
                                  style: TextStyle(
                                    color: Colors.white,
                                      shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0.5, 0.5),
                                        blurRadius: 2)
                                  ]),
                                ),
                                Text(
                                  formater
                                      .format(sumz[0]['totalConfrimed'])
                                      .toString(),
                                  style: TextStyle(shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0.5, 0.5),
                                        blurRadius: 2)
                                  ]),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(5.0, 5.0),
                                  spreadRadius: 2.0,
                                  blurRadius: 10)
                            ]),
                        child: CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Recoverd',
                                  style: TextStyle(shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0.5, 0.5),
                                        blurRadius: 2)
                                  ]),
                                ),
                                Text(
                                  formater
                                      .format(sumz[0]['totalRecover'])
                                      .toString(),
                                  style: TextStyle(shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0.5, 0.5),
                                        blurRadius: 2)
                                  ]),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ]),

            ],
          ),

        ),

      ),
      floatingActionButton: FloatingActionButton(

        splashColor: Colors.deepOrange,
        child: IconButton(
          icon: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
        onPressed: countryfetch,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
