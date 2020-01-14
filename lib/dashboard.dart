import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {

  
 HomePage createState()=> HomePage();

}
class HomePage extends State<Dashboard>{
 //Your code here

int _selectedIndex = 0;
static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
static const List<Widget> _widgetOptions = <Widget>[
  Text(
    'Index 0: Home',
    style: optionStyle,
  ),
  Text(
     'Index 1: Business',
     style: optionStyle,
  ),
  Text(
     'Index 2: School',
     style: optionStyle,
  ),
];

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body:ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.donut_large),
                Text('Hi User',
                 style: TextStyle(
                  fontFamily: 'Opensans',
                  fontSize: 20.0)
                  ),
                Stack(
                  children: <Widget>[
                    Container(height: 60.0, width: 60.0),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(image:AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                    ),
                    Positioned(
                      left: 5.0,
                      top: 40.0,
                      child: Container(
                        height: 15.0,
                        width: 15.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.5),
                          color: Colors.amber,
                          border: Border.all(color: Colors.white
                          )
                        ),
                      ),
                    )
                  ],
                )
              ]
              ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0) ,
            child:    Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'What',
                style: TextStyle(
                  fontFamily: 'Opensans',
                  fontSize: 50.0,
                  color: Colors.amber[400]
                )
              ),
              Text(
                'Gift Card are you',
                style: TextStyle(
                  fontFamily: 'Opensans',
                  fontSize: 50.0,
                  // color: Color(0xFFFD6F4F)
              )
              ),
              Text(
                'getting today?',
                style: TextStyle(
                  fontFamily: 'Opensans',
                  fontSize: 50.0,
                  // color: Color(0xFFFD6F4F)
              )
              )    
            ],
          ),

          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: EdgeInsets.only(left: 20.0),
              height: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color(0xFFF9F9F9)
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search,
                              color: Colors.grey.withOpacity(0.7)
                    ),
                    hintText: "Explore Gift Cards?",
                    hintStyle: TextStyle(
                      fontFamily: 'Opensans',
                      fontSize: 15.0,
                      color: Colors.grey.withOpacity(0.7)
                    )
                  ),
                )
                ),
            )
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Explore Cards',
                    style: TextStyle(
                        fontFamily: 'Opensans',
                        fontSize: 20.0,
                    )
                    ),
                    Icon(Icons.more_horiz, color: Colors.black)
                  ],
                ),
              ),
            ),
       Padding(
         padding: const EdgeInsets.only(left:15.0),
         child: Container(
           height: 300.0,
           child: ListView(
             scrollDirection: Axis.horizontal,
             children: <Widget>[
               _buildCard(context, "Shoprite", "4.1", "assets/images/shoprite.png"),
               _buildCard(context, "Melcom", "5.0", "assets/images/melcom.png"),
               _buildCard(context, "kFC", "5.0", "assets/images/kfc.png")
             ],
           ),
         ),
       )

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.home), onPressed: () {}, focusColor: Colors.amber,),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.business), onPressed: () {  Navigator.of(context).pushNamed("/Allshops");},),
          title: Text('Buy Card'),
        ),
        BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.school), onPressed: () {},),
          title: Text('History'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    )
    );
  }


  _buildCard(BuildContext context, String title, String rating, String imgPath){
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed("/Availableshops");
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: 275.0,
              width: 200.0,
              decoration: BoxDecoration(
                boxShadow: [new BoxShadow(
              color: Colors.grey[300],
              offset: new Offset(7.0, 5.0),
            )],
                borderRadius: BorderRadius.circular(20.0),
                image:  DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover
                )
              ),
            )
          ],
        ),
      ),
    );
  }
  }
