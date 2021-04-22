import 'package:flutter/material.dart';
import 'package:flutter_app/provider/DarkTheme.dart';
import 'package:flutter_app/screend/EstimatedBill.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/main.dart';
class ApplianceList extends StatefulWidget {
  @override
  _State createState() => _State();
}
double unitscount=00.00;
class _State extends State<ApplianceList> {
  final List<String> names = <String>[];
  final List<int> Count = <int>[];
  final List<double> wattage = <double>[];
  final List<double> Time = <double>[];



  // double time, power;int number;
  TextEditingController nameController = TextEditingController();
  TextEditingController power = TextEditingController();
  TextEditingController number = TextEditingController();  TextEditingController time = TextEditingController();

  void addItemToList(){
    setState(() {
      names.insert(0,nameController.text);
      wattage.insert(0, double.parse(power.text));
      Time.insert(0, double.parse(time.text));
      Count.insert(0, int.parse(number.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("BILL CALCULATOR"),
        ),
        body: Column(
            children: <Widget>[
              // Row(
              //   children: [
              //     SizedBox(width: 10,),
              //     SizedBox(width: 200,height: 40,
              //       child: TextField(
              //         controller: nameController,
              //         decoration: InputDecoration(
              //           border: OutlineInputBorder(),
              //           labelText: 'Appliance Name',
              //
              //         ),
              //       ),
              //     ),
              //     SizedBox(width: 10,),
              //     SizedBox(width: 100,height: 40,
              //       child: TextField(
              //         controller: number,
              //         decoration: InputDecoration(
              //           border: OutlineInputBorder(),
              //           labelText: 'Number of Appliance',
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 50,),
              SizedBox(width: 310,height: 40,
                child: Container(
                  color:themeChange.darkTheme?Colors.black26:Colors.lightBlue[100],
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('Appliances ',
                            style: TextStyle(fontSize: 18),
                          ),


                        ],
                      ),
                      SizedBox(width: 10),Text('How Many? ',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 10),Text('Hours/day',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              Column( children: <Widget>[

                // Container(
                //   child: Text("eg.",textAlign: TextAlign.left,
                //     style: TextStyle(fontSize: 18),
                //   ),
                // ),
                           Container(
                             child: Center(
                                child:  SizedBox(width: 310,
                                  child: Row(
                                    children: [

                                      Column(
                                        children: [
                                          SizedBox(width: 110,
                                            child: Text('Fan ',
                                              style: TextStyle(fontSize: 15,color: Colors.blueGrey),
                                            ),
                                          ),
                                          SizedBox(width: 110,
                                            child: Text('[45.0Watts] ',
                                              style: TextStyle(fontSize: 15,color: Colors.blueGrey),
                                            ),
                                          ),

                                        ],
                                      ), Center(
                                        child: SizedBox(width: 100,
                                          child: Text('        2 ',
                                            style: TextStyle(fontSize: 15,color: Colors.blueGrey),
                                          ),
                                        ),
                                      ), SizedBox(width: 100,
                                        child: Text('       5.0',
                                          style: TextStyle(fontSize: 15,color: Colors.blueGrey),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                           ),
              ],),
              SizedBox(width: 250,
                child: RaisedButton(
                  child: Text('Add Appliance'),
                  color:themeChange.darkTheme?Colors.black26:Colors.lightBlue,
                  onPressed: () {
                    // addItemToList();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _buildPopupDialog(context),
                    );
                  },
                ),
              ),
              // SizedBox(height: 30,),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: wattage.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),


                          child: Center(
                            child: SizedBox(width: 310,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(width: 110,
                                        child: Text('${names[index]} ',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Text('[${wattage[index]}Watts] ',
                                        style: TextStyle(fontSize: 18),
                                      ),

                                    ],
                                  ), SizedBox(width: 100,
                                    child: Text('     ${Count[index]} ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ), SizedBox(width: 50,
                                    child: Text('   ${Time[index]} ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  )
              ),

            Row(
                children: [
                  Text("      Consumption",style: TextStyle(fontSize: 25,color: Colors.blueGrey),),
                  consumption(),

                ],
            ),
SizedBox(height: 40,),
              EstimatedBillButton(),
            ]
        )
    );
  }

    Widget _buildPopupDialog(BuildContext context) {
      final themeChange = Provider.of<DarkThemeProvider>(context);
      return  new AlertDialog(
          title: const Text('Add your Appliance Here'),
          content: Container(
            // margin: EdgeInsets.all(15),
            // padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              // border: Border.all(color: Colors.white),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(2, 2),
                  spreadRadius: 2,
                  blurRadius: 1,
                ),
              ],
            ),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Row(
            children: [
            // SizedBox(width: 10,),
            SizedBox(width: 210,height: 40,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Appliance Name',

                ),
              ),
            ),
            SizedBox(width: 10,),

            ],
        ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    // SizedBox(width: 10,),
                    SizedBox(width: 100,height: 40,
                      child: TextField(
                        controller: power,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Rating ',
                        ),
                      ),
                    ),SizedBox(width: 10,),
                    SizedBox(width: 100,height: 40,
                      child: TextField(
                        controller: number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Number',
                        ),
                      ),
                    ),



                  ],
                ),

                SizedBox(height: 30,),
                Row(
                  children: [
                    //
                    SizedBox(width: 100,height: 40,
                      child: TextField(
                        controller: time,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText:' hours used',

                        ),
                      ),
                    ),
                    // SizedBox(width: 10,),
                    new FlatButton(
                      onPressed: () {
                        unitscount=unitscount+0.03*(double.tryParse(number.text))*(double.tryParse(power.text))*(double.tryParse(time.text));
                        addItemToList();
                        Navigator.of(context).pop();
                      },
                      // textColor: Theme.of(context).primaryColor,
                      child: Container(decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        // border: Border.all(color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                      color:themeChange.darkTheme?Colors.black12:Colors.lightBlue,
                            offset: Offset(2, 2),
                            spreadRadius: 2,
                            blurRadius: 1,
                          ),
                        ],
                      ),child: const Text('   ADD  ',style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold),)),
                    ),
                  ],
                ),
              ],
            ),
          ),

 
      );

  }

  consumption() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(2, 2),
            spreadRadius: 2,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          AmountText(
            unitscount.toString(),
            key: Key('tipAmount'),
          ),

        ],
      ),
    );

  }

  EstimatedBillButton() {
    return  RaisedButton(
      padding: EdgeInsets.symmetric(horizontal: 100.0),
      child: new Text("ESTIMATED BILL"),
      // color:themeChange.darkTheme?Colors.black12:Colors.blue,
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),
      ),
      onPressed: (){ units=unitscount;
      print(units);
    Navigator.of(context).push(
    MaterialPageRoute(
    builder: (context)
    => EstimatedBill (),
    ),
    );
    }
    );

        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => EstimatedBill( )));
        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => API_Manager()));
        // print(nameController.text);



  }
}
class AmountText extends StatelessWidget {
  final String text;

  const AmountText(
      this.text, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(text.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 20)),
    );
  }
}