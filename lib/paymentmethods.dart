import 'package:flutter/material.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

void _pay(){
  InAppPayments.setSquareApplicationId("sq0idb-gkx-5YXrYT6njSGbz8Kwdw");
  InAppPayments.startCardEntryFlow(
    onCardNonceRequestSuccess: _cardNonceRequestSuccess,
    onCardEntryCancel: _cardEntryCancel
  );

}

void _cardEntryCancel(){

}

void _cardNonceRequestSuccess(CardDetails result){
  print(result);
  InAppPayments.completeCardEntry(
    onCardEntryComplete: _cardEntryComplete
  );
}

void _cardEntryComplete(){

}


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

