
import 'package:flutter/material.dart';

class MyBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 300,
      child: Column(
        children: <Widget>[
          Placeholder(
            color: Colors.transparent,
            fallbackHeight: 40,//设置占位符宽度
          ),
          const Divider(thickness: 0.5),
          Container(
            height: 60,
            child: Center(
              child: Text(
                "快速添加一条记录",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
