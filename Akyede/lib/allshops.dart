import 'package:flutter/material.dart';
import 'shops.dart';


class Allshops extends StatelessWidget {
  final List<Shop> _allShops = allShops();
  Allshops();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Available Shops",
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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1, crossAxisCount: 2),
      itemCount: _allShops.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(8),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    return Scaffold(
        body: CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 1,
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  color: Colors.amber,
                  /* boxShadow: [
                    BoxShadow(
                      color: Colors.yellow,
                      blurRadius:
                          20.0, // has the effect of softening the shadow
                      spreadRadius:
                          5.0, // has the effect of extending the shadow
                      offset: Offset(
                        10.0, // horizontal, move right 10
                        10.0, // vertical, move down 10
                      ),
                    )
                  ], */
                   borderRadius: new BorderRadius.all(Radius.circular(20.0)),
                ),
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/Availableshops");
                    // _showVouchers(context, _allShops[index]);
                  },
                  child: new Image.asset(
                    "assets/images/" + _allShops[index].image,
                    fit: BoxFit.contain,
                    width: 100.0,
                    // color: Colors.green[100],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
