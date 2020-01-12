// import 'package:flutter/material.dart';
import 'register.dart';
import 'availableshops.dart';
import 'allshops.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';


void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text('“A wonderful gift may not be wrapped as you expect.”',
        textAlign: TextAlign.center,
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
      image: new Image.asset('assets/images/logo.png', alignment: Alignment.center),
      // backgroundGradient: new LinearGradient(colors: [Colors.cyan, Colors.blue], begin: Alignment.topLeft, end: Alignment.bottomRight),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.white,
    );
  }
}

class AfterSplash extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
     
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akyede',
      theme: ThemeData(
        // primaryColor: Colors.white,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
        // backgroundColor: Colors.white
      ),
      home: MyHomePage(title: 'Akyede'),
      routes: <String, WidgetBuilder> {
                  "/Register": (BuildContext context) => new Register(),
                  "/Availableshops": (BuildContext context) => new Availableshops(),
                  "/Allshops": (BuildContext context) => new Allshops()
                }

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
  Widget build(BuildContext context) {    
    Size size = MediaQuery.of(context).size;
     return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Akyede'),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: new Image.asset(
                'assets/images/gift-c.jpg',
                width: size.width,
                height: size.height,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 500.0),
                child: Column(children: <Widget>[
                  Center(
                    child: Text("Akyede",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.black)),
                  ),
                  Center(
                    child: Text(
                        "The perfect gift for your loved one is here...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.black)),
                  ),
                  Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ButtonTheme(
                              minWidth: 300.0,
                              height: 50.0,
                              child: RaisedButton(
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    side: BorderSide(color: Colors.yellow)),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed("/Register");
                                },
                                child: const Text('Get Started',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              )))
          ],
        ))
          ]
        )
    );
  }
}
