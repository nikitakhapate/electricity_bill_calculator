// import 'dart:html';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
// import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'provider/BottomnevigationBarProvider.dart';
import 'provider/DarkTheme.dart';
import 'screend/EstimatedBill.dart';
import 'screend/bottomnevigationBar.dart';
import 'screend/listViewOfAppliance.dart';

int _counter = 0;
double units;
String Tariff,phase;
final unitcontroller =new TextEditingController();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider(create: (context) => DarkThemeProvider()),

      ],
      child: MyApp()));

}

class MyApp  extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  @override
  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();

  }
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return MaterialApp(

      title: 'BILL CALCULATOR',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        backgroundColor: Colors.blue,
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: themeChange.darkTheme?ThemeMode.dark:ThemeMode.light ,
      home:
       MyHomePage(title: 'BILL CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    super.initState();
    unitcontroller.addListener(_onunitschanged);
  }

  _onunitschanged() {
    setState(() {
      units = double.tryParse(unitcontroller.text) ?? 0.0;
    });
  }


  @override
  void dispose() {
    // To make sure we are not leaking anything, dispose any used TextEditingController
    // when this widget is cleared from memory.
    unitcontroller.dispose();
    // Tariff.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);


    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // backgroundColor: themeChange.darkTheme?Colors.white12:Colors.blue[200],
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Card(


            child: Column(

              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(

                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text(
                  "DARK MODE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Checkbox(

                    value:themeChange.darkTheme , onChanged:(bool value) {
                  themeChange.darkTheme = value;


                }),
              ],
            ),
                SizedBox( height: 20.0),
                Row(

                  // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox( width: 20.0),
                      Text(
                        'Tariff',

                        style: TextStyle(

                            fontSize: 20,

                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox( width: 20.0),
                      DropdownButton<String>(
                        // focusColor:Colors.white,
                        key: Key("billAmount"),
                        value: Tariff,
                        //elevation: 5,
                        // style: TextStyle(color: Colors.white),
                        iconEnabledColor:Colors.black,
                        items: <String>[
                          'For Domestic Category',
                          'For Non Residential Supply(NRS)',

                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(

                                fontSize: 14,

                                fontWeight: FontWeight.w500),),
                          );
                        }).toList(),

                        onChanged: (String value) {

                          hint:Text(
                            value,

                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,

                                fontWeight: FontWeight.w500),
                          );
                          setState(() {
                            Tariff = value;
                          });
                        },
                      ),
                    ]),

                SizedBox( height: 20.0),
                Row(

                  // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox( width: 20.0),
                      Text(
                        'Phase',

                        style: TextStyle(

                            fontSize: 20,

                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox( width: 20.0),
                      DropdownButton<String>(
                        // focusColor:Colors.white,
                        key: Key("billAmount"),
                        value: phase,
                        //elevation: 5,
                        // style: TextStyle(color: Colors.white),
                        iconEnabledColor:Colors.black,
                        items: <String>[
                          '1-Phase',
                          '3-Phase',

                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(

                                fontSize: 14,

                                fontWeight: FontWeight.w500),),
                          );
                        }).toList(),

                        onChanged: (String value) {

                          hint:Text(
                            value,

                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,

                                fontWeight: FontWeight.w500),
                          );
                          setState(() {
                            phase = value;
                          });
                        },
                      ),
                    ]),
                // Text("Tariff"),
                SizedBox( height: 20.0),
//             TextField(
//               key: Key("billAmount"),
//               controller: units,
//               decoration: InputDecoration(
//                   border: UnderlineInputBorder(
//                       borderRadius:BorderRadius.circular(20.0)),
//                   hintText: "enter the book",
//                   filled: true,
//                   fillColor: Colors.grey[100],
//                   contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)
//               ),
//
//               // onChanged listener listens to every change to textfield
// //              onChanged: (text){
// //                print(text);
// //              },
//
//             ),
                TextFormField(
                  key: Key("UNITS"),
                  controller: unitcontroller,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Enter the  Units',
                    labelText: ' Units',
                    labelStyle: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold
                    ),
                     fillColor: Colors.blue,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),

                SizedBox( height: 20.0),
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 100.0),
                  child: new Text("ESTIMATED BILL"),
                  color:
                    themeChange.darkTheme?Colors.black12:Colors.blue,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: (){
                      Navigator.of(context).push(
                         MaterialPageRoute(
                              builder: (context)
                            => EstimatedBill ()
                        ),
                    );

                     // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => EstimatedBill( )));
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => API_Manager()));
                    // print(nameController.text);

                  },

                ),
               SizedBox(height: 50,),
               SizedBox( height: 100,
            child: GestureDetector(
              onTap: () {
                unitscount=00.00;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ApplianceList()),
                );
              } ,

              child: SizedBox(
                child: Text(
                  "Don't Know Units",

                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14,

                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



