import 'package:flutter/material.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';
// import 'package:flutter_rave/flutter_rave.dart';

void _pay() async {
  await InAppPayments.setSquareApplicationId("sandbox-sq0idb-gkx-5YXrYT6njSGbz8Kwdw");
  await InAppPayments.startCardEntryFlow(
    onCardNonceRequestSuccess: _cardNonceRequestSuccess,
    onCardEntryCancel: _cardEntryCancel
  );

}

void _cardEntryCancel(){

}



/// Callback when successfully get the card nonce details for processing
///card entry is still open and waiting for processing card nonce details
void _cardNonceRequestSuccess(CardDetails result) async {
  // print(result);
  // InAppPayments.completeCardEntry(
  //   onCardEntryComplete: _cardEntryComplete
  // );

      try {
      // take payment with the card nonce details
      // you can take a charge
      // await chargeCard(result);
      print("Success");
      print(result);
      // payment finished successfully
      // you must call this method to close card entry
      InAppPayments.completeCardEntry(
          onCardEntryComplete: _cardEntryComplete);
    } on Exception catch (ex) {
      // payment failed to complete due to error
      // notify card entry to show processing error
      InAppPayments.showCardNonceProcessingError(ex.toString());
    }
  }




void _cardEntryComplete(){

}

//  _payment(BuildContext context) {
//     final _onFailure = SnackBar(content: Text('Transaction failed'));
//     final _onClosed = SnackBar(content: Text('Transaction closed'));
//     final _rave = RaveCardPayment(
//       isDemo: true,
//       encKey: "c53e399709de57d42e2e36ca",
//       publicKey: "FLWPUBK-d97d92534644f21f8c50802f0ff44e02-X",
//       transactionRef: "hvHPvKYaRuJLlJWSPWGGKUyaAfWeZKnm",
//       amount: 100,
//       email: "demo1@example.com",
//       onSuccess: (response) {
//         print("$response");
//         print("Transaction Successful");
//         if (true) {
//           Scaffold.of(context).showSnackBar(
//             SnackBar(
//               content: Text("Transaction Sucessful!"),
//               backgroundColor: Colors.green,
//               duration: Duration(
//                 seconds: 5,
//               ),
//             ),
//           );
//         }
//       },
//       onFailure: (err) {
//         print("$err");
//         print("Transaction failed");
//         Scaffold.of(context).showSnackBar(_onFailure);
//       },
//       onClosed: () {
//         print("Transaction closed");
//         Scaffold.of(context).showSnackBar(_onClosed);
//       },
//       context: context,
//     );
//     _rave.process();
//   }


class Method {

  //--- Name Of City
  final String name;
  //-- image
  final String image;

  Method({this.name, this.image}); 
}

List<Method> allMethods()
{
  var payMethods = new List<Method>();

  payMethods.add(new Method(name:"MOMO",  image: "momo.png"));
  payMethods.add(new Method(name:"VISA",  image: "visa.png"));
  return payMethods;
}


class PaymentMethods extends StatelessWidget {

  final List<Method> _allMethods = allMethods();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Choose Payment Method"),
      ),
            body: new Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: getHomePageBody(context)
          )
          
    );
  }

getHomePageBody(BuildContext context) {
  return ListView.builder(
    itemCount: _allMethods.length,
    itemBuilder: _getItemUI,
    padding: EdgeInsets.all(0.0),
  );
}


Widget _getItemUI(BuildContext context, int index) {
  
  return  new Column(
    
    
    children: <Widget>[
      new Container(
        padding: EdgeInsets.only(top: 100.0),
      ),
        GestureDetector(
            onTap: () { _allMethods[index].name == "VISA" ? _pay() : _showPayment(context, _allMethods[index]); },
            child: new Container(
          padding: EdgeInsets.all(20.0),
          child: new Image.asset(
          "assets/images/" + _allMethods[index].image,
          fit: BoxFit.fitHeight,
          width: 100.0,
          height: 90,
        ),
        decoration: new BoxDecoration(
          color: Colors.yellow[100],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [new BoxShadow(
              color: Colors.yellow[300],
              offset: new Offset(10.0, 7.0),
            )]
        ),
        )
        ),
      new Container(
        padding: EdgeInsets.all(5.0),
      )
    ],
    
     
  );

  
}
}

_showPayment(BuildContext context, Method item) {
  
  final SnackBar objSnackbar = new SnackBar(
    content: new Text("${item.name} was tapped"),
    backgroundColor: Colors.amber,
  );
  Scaffold.of(context).showSnackBar(objSnackbar);

}

