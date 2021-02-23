import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  var product_carts = [
    {
      "name": "Percy Jackson and The Lightning Thief",
      "picture": "assets/products/1.jpg",
      "price": 22.57,
      "quantity" : 2
    },
    {
      "name": "Harry Porter and The Socerers Stone",
      "picture": "assets/products/2.jpg",
      "price": 16.57,
      "quantity" : 3
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index){
        return new SingleCartProduct(cart_product_name: product_carts[index]["name"],
        cart_product_picture: product_carts[index]["picture"],
        cart_product_quantity: product_carts[index]["quantity"],
        cart_product_price: product_carts[index]["price"]);
      }
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_quantity;
  final cart_product_price;

  SingleCartProduct({this.cart_product_name, this.cart_product_picture, this.cart_product_quantity, this.cart_product_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(cart_product_picture, width:80.0, height: 80.0),
        title: Text(cart_product_name),
        subtitle: Column(
          children: <Widget>[
            // new Row(
            //   children: <Widget>[
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: new Text("Quantity: ")
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: new Text(cart_product_quantity, style: TextStyle(color: Colors.red),)
            //     )
            //   ],
            // ),
            Container(
              alignment: Alignment.topLeft,
              child: new Text("\$${cart_product_price}", style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),),
            )
          ],
        ),
        trailing: new Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
            new Text("$cart_product_quantity"),
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
          ],
        ),
      ),
    );
  }

  void addQuantity()
  {
    // cart_product_quantity = cart_product_quantity + 1;
  }

  void subQuantity()
  {
    // cart_product_quantity = cart_product_quantity - 1;
  }
}