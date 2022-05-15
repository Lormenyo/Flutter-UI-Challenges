class Shop {

  //--- Name Of City
  final String name;
  //-- image
  final String image;
  //--- vouchers
  final String vouchers;


  Shop({this.name,this.vouchers,this.image}); 
}

List<Shop> allShops()
{
  var lstOfShops = new List<Shop>();

  lstOfShops.add(new Shop(name:"Shoprite", vouchers: "Available", image: "shoprite.png"));
  lstOfShops.add(new Shop(name:"Melcom", vouchers: "Available", image: "melcom.png"));
  lstOfShops.add(new Shop(name:"KFC", vouchers: "Available", image: "kfc.png"));
  lstOfShops.add(new Shop(name:"Doughman", vouchers: "Available", image: "doughman.png"));
  lstOfShops.add(new Shop(name:"Pinkbery", vouchers: "Available", image: "pk.png"));
  lstOfShops.add(new Shop(name:"Max-Mart", vouchers: "Available", image: "max.png"));
  lstOfShops.add(new Shop(name:"Eddy's Pizza", vouchers: "Available", image: "edd-pizza.png"));
  return lstOfShops;
}