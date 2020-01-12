class Coupon {

  //--- Name Of City
  final String name;
  //-- image
  final String image;
  //--- vouchers
  final String vouchers;


  Coupon({this.name,this.vouchers,this.image}); 
}

List<Coupon> allCoupons()
{
  var lstOfShops = new List<Coupon>();

  lstOfShops.add(new Coupon(name:"Friend", vouchers: "GHC 20.00", image: "shades.jpg"));
  lstOfShops.add(new Coupon(name:"Best Friend", vouchers: "GHC 40.00", image: "love_eyes.png"));
  lstOfShops.add(new Coupon(name:"BFF", vouchers: "GHC 50.00", image: "kissy_face.png"));
  lstOfShops.add(new Coupon(name:"Family", vouchers: "GHC 10.00", image: "family.png"));
  lstOfShops.add(new Coupon(name:"Custom card", vouchers: "GHC ___", image: "thinking.png"));
  return lstOfShops;
}