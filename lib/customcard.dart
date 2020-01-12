import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: Text("Custom Card"),
      ),
      body: new Padding(
        padding: new EdgeInsets.only(top:70.0, left: 10.0, right:10.0, bottom: 5.0),
        child: new Column(
          children: <Widget>[
            new Padding(
                padding: new EdgeInsets.only(top: 70.0, bottom: 10.0),
                child:      new Text("Enter Amount",
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 2.0
              ),
               textAlign: TextAlign.right
               ),
            ),
       
            new Container(
                padding: const EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0, bottom: 0.0),
                alignment: Alignment.center,
                height: 60.0,
                decoration: new BoxDecoration(
                  color: Colors.grey[200],
                  border: new Border.all(
                    color: Colors.grey,
                    width: 1.0
                  ),
                  borderRadius: new BorderRadius.circular(5.0)
                ),
                child: new TextField(
                  decoration: null,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  obscureText: false,
                ),
              ),
              RaisedButton(
                child: const Text("Proceed to Pay"),
                onPressed: () {
            // Navigate to second route when tapped.
              Navigator.of(context).pushNamed("/PaymentMethods");
          },
                 
                )
            
          ],
        ),
      ),
    );
  }
}
