import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Register'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.indigo[800],
                Colors.indigo[700],
                Colors.indigo[600],
                Colors.indigo[400],
              ],
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: new Image.asset('assets/images/gold-gift-box.png', width: 70, height: 150)
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: TextField(
                            style: new TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            obscureText: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(25.0))),
                                labelText: 'Name',
                                labelStyle: TextStyle(color: Colors.white)
                                ),
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: TextField(
                            style: new TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.phone,
                            obscureText: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(25.0))),
                                labelText: 'Telephone',
                                labelStyle: TextStyle(color: Colors.white),
                                fillColor: Colors.white),
                          ))),
                Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: TextField(
                            style: new TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                           /*  keyboardType: TextInputType.phone, */
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(25.0))),
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.white),
                                fillColor: Colors.white),
                          ))),
                  Center(
                      child: Padding(
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
                                      .pushNamed("/Dashboard");
                                },
                                child: const Text('Submit',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              ))))
                ],
              )),
        ));
  }
}
