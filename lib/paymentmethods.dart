import 'package:flutter/material.dart';


class Method {

  //--- Name Of City
  final String name;
  //-- image
  final String image;
  //--- vouchers
  final String vouchers;


  Method({this.name,this.vouchers,this.image}); 
}

List<Method> allMethods()
{
  var payMethods = new List<Method>();

  payMethods.add(new Method(name:"MOMO", vouchers: "GHC 20.00", image: "momo.png"));
  payMethods.add(new Method(name:"VISA", vouchers: "GHC 40.00", image: "visa.png"));
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
            onTap: () { _showPayment(context, _allMethods[index]); },
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

