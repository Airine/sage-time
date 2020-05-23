// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';
import 'my_drawer.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'The Sage Time';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const List _tabs = [
    ["主页", "日历", "列表"],
    ["折线", "直方", "报告"]
  ];
  List tabs = _tabs[0];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Color> _homeColors = <Color>[
    Colors.blue,
    Colors.black
  ];

  static const List<Color> _chartColors = <Color>[
    Colors.black,
    Colors.blue
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      tabs = _tabs[index];
    });
  }

  void _onHomePressed() {
    _onItemTapped(0);
  }


  void _onChartPressed() {
    _onItemTapped(1);
  }

  void _onAdd() {
    // TODO: implement onAdd
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: tabs.length,
      child:
        Scaffold(
        appBar: AppBar(
          title: const Text('贤者时间'),
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.dashboard, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          bottom:
          TabBar(
            tabs:
//            (_selectedIndex == 0) ?
            tabs.map((e) => Tab(text: e)).toList()
//            _tabs.map((e) => Tab(text: e)).toList()
          )
        ),
        body:
          TabBarView(
            children: tabs.map((e) { //创建3个Tab页
              return Container(
                alignment: Alignment.center,
                child: Text(e, textScaleFactor: 5),
              );
            }).toList()
          ),

//        Builder(builder: (context){
//          switch (_selectedIndex) {
//            case 0:
//              return TabBarView(
//                children: tabs.map((e) { //创建3个Tab页
//                  return Container(
//                    alignment: Alignment.center,
//                    child: Text(e, textScaleFactor: 5),
//                  );
//                }).toList()
//              );
//              break;
//            default:
//              return TabBarView(
//                  children: _tabs.map((e) { //创建3个Tab页
//                    return Container(
//                      alignment: Alignment.center,
//                      child: Text(e, textScaleFactor: 5),
//                    );
//                  }).toList()
//              );
//          }
//        }),
        drawer: MyDrawer(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: _onHomePressed,
                color: _homeColors[_selectedIndex],
              ),
              SizedBox(), //中间位置空出
              IconButton(
                icon: Icon(Icons.bubble_chart),
                onPressed: _onChartPressed,
                color: _chartColors[_selectedIndex],
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
        floatingActionButton: FloatingActionButton( //悬浮按钮
          child: Icon(Icons.add),
          onPressed: _onAdd,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      )
    );
  }
}
