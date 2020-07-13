
import 'package:flutter/material.dart';
import 'package:sage_time/view/my_drawer.dart';
import 'package:sage_time/view/bottom_sheet.dart';
import 'package:sage_time/view/home_list.dart';

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'The Sage Time';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {

  @override
  _MainWidgetState createState() => _MainWidgetState();

}

class _MainWidgetState extends State<MainWidget> {

  int _selectedIndex = 0;
  List tabs = _tabs[0];
  static const List _tabs = [
    ["主页", "日历", "列表"],
    ["折线", "直方", "报告"]
  ];
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

  @override
  void initState() {
    super.initState();
  }

  void _showBottomSheet(BuildContext context) {
    Scaffold.of(context)
        .showBottomSheet<void>(
          (context) {
        return MyBottom();
      },
      elevation: 25,
    );
  }

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
                  tabs.map((e) => Tab(text: e)).toList()
              )
          ),
          body:
          TabBarView(
              children: tabs.map((e) { //创建3个Tab页
                if (e == "主页") {
                  return HomeList();
                }
                return Container(
                  alignment: Alignment.center,
                  child: Text(e, textScaleFactor: 5),
                );
              }).toList()
          ),
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
          floatingActionButton:
          Builder(builder: (BuildContext context) {
            return FloatingActionButton( //悬浮按钮
              child: Icon(Icons.add),
              onPressed: () {
                _showBottomSheet(context);
              },
            );
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        )
    );
  }
}
