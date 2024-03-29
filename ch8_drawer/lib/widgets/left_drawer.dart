import 'package:ch8_drawer/widgets/menu_list_tile.dart';
import 'package:flutter/material.dart';

class LeftDrawerWidget extends StatelessWidget {

  const LeftDrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: Icon(
              Icons.face,
              size: 48.0,
              color: Colors.white,
            ),
            accountName: Text('JohnDoe'),
            accountEmail: Text('johndoe@ghost.com'),
            otherAccountsPictures: <Widget>[
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
            ],
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_top_mountain.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          MenuListTileWidget(),
        ],
      ),
    );
  }
}
