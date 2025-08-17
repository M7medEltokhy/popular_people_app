import 'package:flutter/material.dart';
import 'package:itproject/prisentation/screens/album_screen/album_screen.dart';
import 'package:itproject/prisentation/screens/details_screen/details_screen.dart';

class HomeScreenItem extends StatelessWidget {
  String id;
  String name;
  String field;
  Color? itemColor;
  double? height;

  HomeScreenItem({
    super.key,
    required this.id,
    this.itemColor,
    this.height,
    required this.name,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: itemColor ?? Colors.cyan,
        // image: DecorationImage(
        //   fit: BoxFit.cover,
        //   image: NetworkImage(
        //     imagePath,
        //   ),
        // ),
        borderRadius: BorderRadius.circular(12),
      ),
      height: height ?? 150,
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),
          Text(
            field,
            style: TextStyle(color: Colors.white),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => DetailsScreen(
                            id: id,
                          )));
            },
            height: 30,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            splashColor: Colors.blue,
            child: Text(
              "Show details",
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          SizedBox(height: 8,),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => AlbumScreen(
                            id: id,
                          )));
            },
            height: 30,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            splashColor: Colors.blue,
            child: Text(
              "Show album",
              style: TextStyle(color: Colors.cyan),
            ),
          ),
        ],
      ),
    );
  }
}
