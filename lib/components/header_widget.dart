import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Icon(
                Icons.menu,
                color: Colors.white,
                size: 35.0,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'TODO LIST',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ],
          ),
          Text(
            '12 Tasks',
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
        ],
      ),
    );
  }
}
