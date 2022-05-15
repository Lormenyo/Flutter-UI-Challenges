import 'package:flutter/material.dart';
import 'package:flutter_rave/flutter_rave.dart';

class Visa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Visa Payment"),
      ),
      body: Center(
        child: Builder(
          builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: InkWell(
                onTap: () => _pay(context),
                child: Card(
                  color: Colors.amber,
                  elevation: 15,
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Card Payment",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.payment,
                            color: Colors.black,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_pay(BuildContext context) {
  final _onFailure = SnackBar(content: Text('Transaction failed'));

  final _onClosed = SnackBar(content: Text('Transaction closed'));

  final _rave = RaveCardPayment(
    isDemo: true,
    encKey: "c53e399709de57d42e2e36ca",
    publicKey: "FLWPUBK-d97d92534644f21f8c50802f0ff44e02-X",
    transactionRef: "hvHPvKYaRuJLlJWSPWGGKUyaAfWeZKnm",
    amount: 100,
    email: "demo1@example.com",
    onSuccess: (response) {
      print("$response");

      print("Transaction Successful");

      if (true) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Transaction Sucessful!"),
            backgroundColor: Colors.green,
            duration: Duration(
              seconds: 5,
            ),
          ),
        );
      }
    },
    onFailure: (err) {
      print("$err");

      print("Transaction failed");

      Scaffold.of(context).showSnackBar(_onFailure);
    },
    onClosed: () {
      print("Transaction closed");

      Scaffold.of(context).showSnackBar(_onClosed);
    },
    context: context,
  );

  _rave.process();
}
