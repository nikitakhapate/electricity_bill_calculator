


import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/BottomnevigationBarProvider.dart';
import 'package:flutter_app/provider/DarkTheme.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class BottomNavigationBarExample extends StatefulWidget{
  @override
  _BottomNavigationBar createState() =>
      _BottomNavigationBar();
// TODO: implement createSt




}

class _BottomNavigationBar extends State<BottomNavigationBarExample> {

  var currentTab=[

    like(),
    MyHomePage(title: 'BILL CALCULATOR'),

  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);

    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeChange.darkTheme?Colors.white12:Colors.white,
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: CurvedNavigationBar(

        backgroundColor: themeChange.darkTheme?Colors.white12:Colors.blue[200],
        index: provider.currentIndex,
        onTap: (index) {
          //Handle button tap
          provider.currentIndex=index;
        },
        items: [
          CircleAvatar(child: Icon(Icons.favorite)),
          CircleAvatar(child: Icon(Icons.search_off)),
        ],

      ),

    );
  }
// TODO: implement build




}

class abc extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,

        ),
      ),
    );
    // throw UnimplementedError();
  }

}

class like extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blueAccent,

        ),
      ),
    );
    // throw UnimplementedError();
  }

}