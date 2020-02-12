import 'package:flutter/material.dart';

class AppBarTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      child: Container(
          child: Column(
        children: <Widget>[
          Container(height: statusBarHeight),
          Container(
            height: 130,
            padding: EdgeInsets.only(top: 14, bottom: 14, left: 12, right: 12),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.menu, size: 30),
                        onPressed: () {},
                        color: Theme.of(context).primaryColor),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Pokedex',
                        style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Theme.of(context).primaryColor)),
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
