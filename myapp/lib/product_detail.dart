import 'package:flutter/material.dart';
import 'package:myapp/home/home.dart';

class ProductDetail extends StatefulWidget {
  final product_detail_name;
  final product_detail_picture;
  final price_detail;

  ProductDetail(
      {this.product_detail_name,
      this.product_detail_picture,
      this.price_detail});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => new HomePage()));},
          child: Text('BookShop'),
        ) ,
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "\$${widget.price_detail}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Quantity"),
                          content: new Text("Choose the quantity"),
                          actions: <Widget>[
                            new MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                              child: new Text("close"),
                            )
                          ],
                        );
                      },
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Quantity")),
                      Expanded(child: new Icon(Icons.arrow_drop_down))
                    ],
                  ),
              ))
            ],
          ),
          Container(
            height: 45.0,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: new Center(
                        child: Text("Buy now", style: TextStyle(fontSize: 17),),
                      )),
                    ],
                  ),
                )),
                new IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    color: Colors.red,
                    onPressed: () {}),
                new IconButton(
                    icon: Icon(Icons.favorite_border),
                    color: Colors.red,
                    onPressed: () {})
              ],
            )
          ),
          Divider(color: Colors.black,),
          new ListTile(
            title: new Text("Product description"),
            subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum", style: TextStyle(fontSize: 14),),
          ),
          Divider(color:Colors.black),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Product name", style: TextStyle(color: Colors.grey)),
              ),
              Padding(padding: const EdgeInsets.all(5.0),
              child: new Text(widget.product_detail_name),
              )
            ],
          ),
          Divider(color:Colors.black),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Similar Product"),
          ),
          Container(
            height: 360,
            child: SimilarProduct(),
          )
        ],
      ),
    );
  }
}


class SimilarProduct extends StatefulWidget {
  @override
  _SimilarProductState createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
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
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SimilarSingleProduct(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            price: product_list[index]['price'],
          );
        });
  }
}

class SimilarSingleProduct extends StatelessWidget {
  final String product_name;
  final String product_picture;
  final price;

  SimilarSingleProduct(
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
