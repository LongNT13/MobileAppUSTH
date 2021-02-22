import 'package:flutter/material.dart';

class ProductHome extends StatefulWidget {
  @override
  _ProductHomeState createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  var product_list = [
    {
      "name": "Percy Jackson and the lightning thief",
      "picture": "assets/products/1.jpg",
      "old_price": 21.57,
      "price": 22.57,
    },
    {
      "name": "Harry Porter and the Socerer stone",
      "picture": "assets/products/2.jpg",
      "old_price": 11.57,
      "price": 16.57,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            old_price: product_list[index]['old_price'],
            price: product_list[index]['price'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final String product_name;
  final String product_picture;
  final old_price;
  final price;

  SingleProduct(
      {this.product_name, this.product_picture, this.old_price, this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: this.product_name,
        child: Material(
          child: InkWell(
            onTap: (){

            },
            child: GridTile(
              footer: Container(
                height: 55.0,
                color: Colors.white70,
                child: ListTile(
                  leading: Text(this.product_name, style: TextStyle(fontWeight: FontWeight.bold),),
                  title: Text(price.toString()),
                ),
              ),
              child: Image.asset(
                product_picture,
                fit: BoxFit.cover
              ),
            ),
          ),
        ),
      ),
    );
  }
}
