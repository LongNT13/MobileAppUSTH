import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:myapp/home/product_home.dart';

import 'category_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/slider1.jpeg'),
          AssetImage('assets/slider2.png'),
          AssetImage('assets/slider3.jpeg'),
        ],
        autoplay: true,
        dotSize: 5.0,
        indicatorBgPadding: 10.0,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('BookShop'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            // header
            new UserAccountsDrawerHeader(
              accountName: Text('Long'),
              accountEmail: Text('tanguyenlongntt@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.blueGrey),
            ),
            // body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Account'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Orders'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite),
              ),
            ),
            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          // slider carousel
          image_carousel,
          // padding widget all
          new Padding(padding: const EdgeInsets.all(10.0),
          child: new Text('Categories'),
          ),
          CategoryHome(),

          // 
          new Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Text('Products'),
          ),

          // grid view
          Container(
            height: 350.0,
            child: ProductHome(),
          )
        ],
      ),
    );
  }
}
