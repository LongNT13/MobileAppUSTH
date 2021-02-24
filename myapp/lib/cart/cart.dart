import 'package:flutter/material.dart';
import 'package:myapp/cart/cart_product.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Cart'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: CartProduct(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: Text("Total: "),
              subtitle: Text("\$230"),
            )),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: MaterialButton(onPressed: (){},
                  child: Text("Check out", style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}