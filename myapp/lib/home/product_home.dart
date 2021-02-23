import 'package:flutter/material.dart';
import 'package:myapp/product_detail.dart';

class ProductHome extends StatefulWidget {
  @override
  _ProductHomeState createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  var product_list = [
    {
      "name": "Percy Jackson and The Lightning Thief",
      "picture": "assets/products/1.jpg",
      "price": 22.57,
    },
    {
      "name": "Harry Porter and The Socerers Stone",
      "picture": "assets/products/2.jpg",
      "price": 16.57,
    },
    {
      "name": "Percy Jackson and The Lightning Thief",
      "picture": "assets/products/1.jpg",
      "price": 22.57,
    },
    {
      "name": "Harry Porter and The Socerers Stone",
      "picture": "assets/products/2.jpg",
      "price": 16.57,
    },
    {
      "name": "Percy Jackson and The Lightning Thief",
      "picture": "assets/products/1.jpg",
      "price": 22.57,
    },
    {
      "name": "Harry Porter and The Socerers Stone",
      "picture": "assets/products/2.jpg",
      "price": 16.57,
    },
    {
      "name": "Percy Jackson and The Lightning Thief",
      "picture": "assets/products/1.jpg",
      "price": 22.57,
    },
    {
      "name": "Harry Porter and The Socerers Stone",
      "picture": "assets/products/2.jpg",
      "price": 16.57,
    },
    {
      "name": "Percy Jackson and The Lightning Thief",
      "picture": "assets/products/1.jpg",
      "price": 22.57,
    },
    {
      "name": "Harry Porter and The Socerers Stone",
      "picture": "assets/products/2.jpg",
      "price": 16.57,
    },
    {
      "name": "Percy Jackson and The Lightning Thief",
      "picture": "assets/products/1.jpg",
      "price": 22.57,
    },
    {
      "name": "Harry Porter and The Socerers Stone",
      "picture": "assets/products/2.jpg",
      "price": 16.57,
    },
    {
      "name": "Harry Porter and The Socerers Stone",
      "picture": "assets/products/2.jpg",
      "price": 16.57,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            price: product_list[index]['price'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final String product_name;
  final String product_picture;
  final price;

  SingleProduct(
      {this.product_name, this.product_picture, this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: new Text("product_hero"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetail(product_detail_name: this.product_name, product_detail_picture: this.product_picture, price_detail: this.price))),
            child: GridTile(
              footer: Container(
                height: 55.0,
                color: Colors.white70,
                child: ListTile(
                  leading: Text(this.product_name.substring(0, 28) + "... \n\$" + price.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
              child: Image.asset(
                product_picture,
                fit: BoxFit.contain
              ),
            ),
          ),
        ),
      ),
    );
  }
}
