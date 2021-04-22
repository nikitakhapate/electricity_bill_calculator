

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/DarkTheme.dart';
import '../main.dart';
double Totalcost;
class EstimatedBill extends StatefulWidget {
  @override
  _EstimatedBill createState() => _EstimatedBill();
}

class _EstimatedBill extends State<EstimatedBill> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("BILL CALCULATOR"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
          child: Column(

    // mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
          SizedBox( height: 20.0),
    SizedBox( width: 20.0),
    Text(
    Tariff,

    style: TextStyle(
    color: Colors.black,
    fontSize: 20,

    fontWeight: FontWeight.w500),
    textAlign: TextAlign.left,
    ),
    SizedBox( height: 20.0),
    chart(),
    // Text("Tariff"),
        SizedBox( height: 70.0),
        Center(
          child: Text(
            "your total elctricity bill is $Totalcost Rs. for $units units",

            style: TextStyle(
                // color: Colors.black,
                fontSize: 15,

                fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
    ],
    ),

          ),
        ),
      ),
    );
  }

  chart() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double Wheeling=(1.45)*(units);
    double ec;double ed,fc,fac=00.00;
double ecd150,ecd250,ecd,edc;
    fc=(phase=='1-Phase')?65:185;

    if(Tariff=='For Domestic Category'){
      ecd150=2.75;ecd250=4.80;ecd=5.20;edc=0.09;

    }
    else  if(Tariff=='For Non Residential Supply(NRS)'){
      ecd150=5.00;ecd250=5.30;ecd=5.60;edc=0.11;
    }
      if(units<150){
        ec=units*ecd150;
      }else if(units<250){
        ec=150*ecd150+(units-150)*ecd250;
      } else ec=(units-400)*ecd+1512.5;
     print(ec);
    Totalcost=fc+ec+Wheeling+fac;
    ed=0.15*Totalcost;Totalcost+=ed;
    return Container(color:themeChange.darkTheme?Colors.black12:Colors.lightBlueAccent[100],
      child: Table(
        defaultColumnWidth: FixedColumnWidth(155.0),
        // border: TableBorder.all(
        //     color: Colors.black,
        //     style: BorderStyle.solid,
        //     width: 2),

        children: [
          TableRow(

              children: [
            Column(
                children:[
                  TableCell(
                      child: Container(color:themeChange.darkTheme?Colors.black26:Colors.lightBlue,height: 50,

                          child: Column(
                              children:[SizedBox(height: 10,),
                                Text('     Particulars     ', style: TextStyle(fontSize: 20.0),textAlign:TextAlign.center),]))),
                ]),

            // Column(children:[Text('Amount', style: TextStyle(fontSize: 20.0))
              TableCell(
                  child: Container(color:themeChange.darkTheme?Colors.black26:Colors.lightBlue,height: 50,

                      child: Column(
                          children:[SizedBox(height: 10,),
                            Text('     Amount     ', style: TextStyle(fontSize: 20.0),textAlign:TextAlign.center),]))),
            ]),
            // Column(children:[Text('Review', style: TextStyle(fontSize: 20.0))]),


          TableRow( children: [
            TableCell(
                child: Container(height: 50,

                    child: Column(
                        children:[SizedBox(height: 10,),
                          Text('Fixed Charges(FC)',textAlign:TextAlign.center),]))),
            Column(children:[Text(fc.toString())]),
            // Column(children:[Text('5*')]),
          ]),
          TableRow( children: [
            TableCell(
                child: Container(height: 50,

                    child: Column(
                        children:[SizedBox(height: 10,),
                          Text('Energy Charge(EC)',textAlign:TextAlign.center),])
                )
            ),
            Column(children:[Text(ec.toString())]),
            // Column(children:[Text('5*')]),
          ]),
          TableRow( children: [
            TableCell(
                child: Container(height: 50,

                    child: Column(
                        children:[SizedBox(height: 10,),
                          Text('Electricity Duty(ED) @ '),Text('16.0%')]))),
            Column(children:[Text(ed.toString())]
            ),
            // Column(children:[Text('5*')]),
          ]),
          TableRow( children: [
            TableCell(
                child: Container(height: 50,

                    child: Column(
                        children:[SizedBox(height: 10,),
                          Text(' Wheeling Charge@'),Text('1.45Rs/U')]))),
            Column(children:[Text(Wheeling.toString())]),
            // Column(children:[Text('5*')]),
          ]),
          TableRow( children: [
            TableCell(
                child: Container(height: 50,

                    child: Column(
                        children:[SizedBox(height: 10,),
                          Text('Fuel Adjustment'),Text('Charge(FAC)')]))),
            Column(children:[Text(fac.toString())]),
            // Column(children:[Text('5*')]),
          ]),

          TableRow(

              children: [
                Column(
                    children:[
                      TableCell(
                          child: Container(color:themeChange.darkTheme?Colors.black26:Colors.lightBlue,height: 50,

                              child: Column(
                                  children:[SizedBox(height: 10,),
                                    Text('    TOTAL BILL    ', style: TextStyle(fontSize: 20.0),textAlign:TextAlign.center),]))),
                    ]),

                // Column(children:[Text('Amount', style: TextStyle(fontSize: 20.0))
                TableCell(
                    child: Container(color:themeChange.darkTheme?Colors.black26:Colors.lightBlue,height: 50,

                        child: Column(
                            children:[SizedBox(height: 10,),
                              Text( Totalcost.toString(), style: TextStyle(fontSize: 20.0),textAlign:TextAlign.center),]))),
              ]),

        ],
      ),


    );
  }

}

