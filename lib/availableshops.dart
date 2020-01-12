import 'package:flutter/material.dart';
import 'coupons.dart';


class Availableshops extends StatelessWidget {
 
final List<Coupon> _allCoupons = allCoupons();

Availableshops();

@override
Widget build(BuildContext context) {
  return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Select a Voucher",
          style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
      ),
      body: new Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: getHomePageBody(context)));
}



getHomePageBody(BuildContext context) {
  return ListView.builder(
    itemCount: _allCoupons.length,
    itemBuilder: _getItemUI,
    padding: EdgeInsets.all(0.0),
  );
}


Widget _getItemUI(BuildContext context, int index) {

  return new Card(
      

      child: new Column(
    
    children: <Widget>[
      new ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Image.asset(
          "assets/images/" + _allCoupons[index].image,
          fit: BoxFit.fitHeight,
          width: 100.0,
          height: 90,
        )
        ),

        title: new Text(
          _allCoupons[index].name,
          style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        subtitle: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_allCoupons[index].vouchers,
                  style: new TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.normal))
            ]),
        //trailing: ,
        onTap: () {
         
          index == _allCoupons.length-1 ? Navigator.of(context).pushNamed("/CustomCard") : Navigator.of(context).pushNamed("/PaymentMethods");
        },
      ),
    ],
    
     
  ));

  
}
}

// _showVouchers(BuildContext context, Coupon item) {
//   final SnackBar objSnackbar = new SnackBar(
//     content: new Text("Proceed to pay for ${item.vouchers} Voucher. "),
//     backgroundColor: Colors.amber,
//   );
//   Scaffold.of(context).showSnackBar(objSnackbar);
// }

