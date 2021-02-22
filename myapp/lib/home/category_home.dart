import 'package:flutter/material.dart';

class CategoryHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'assets/028-literature.png',
            image_caption: 'Fiction'
          ),
          Category(
            image_location: 'assets/038-romance.png',
            image_caption: 'Romance'
          ),
          Category(
            image_location: 'assets/017-education.png',
            image_caption: 'Education'
          ),
          Category(
            image_location: 'assets/039-science.png',
            image_caption: 'Science'
          ),
          Category(
            image_location: 'assets/042-sports.png',
            image_caption: 'Sport'
          ),
          Category(
            image_location: 'assets/044-technology.png',
            image_caption: 'Technology'
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(onTap: (){},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              this.image_location,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(this.image_caption, style: new TextStyle(fontSize: 12.0),),
            ),
          ),
        ),
      ),
    );
  }
}