
import 'package:flutter/material.dart';
import 'package:sage_time/model/record.dart';
import 'package:sage_time/util/db_connection.dart';
import 'package:sage_time/view/record_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => new _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List<Record> records = new List<Record>();
  DatabaseHelper db = new DatabaseHelper();

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
//    items.add((items.length+1).toString());
    if(mounted)
      setState(() {

      });
    _refreshController.loadComplete();
  }


  @override
  void initState() {
    super.initState();

    db.getAllRecords().then((res) {
      setState(() {
        res.forEach((record){
          records.add(Record.fromMap(record));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        footer: CustomFooter(
          builder: (BuildContext context,LoadStatus mode){
            Widget body ;
            if(mode==LoadStatus.idle){
              body =  Text("上拉加载");
            }
            else if(mode == LoadStatus.failed){
              body = Text("加载失败！点击重试！");
            }
            else if(mode == LoadStatus.canLoading){
              body = Text("松手,加载更多!");
            }
            else{
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        child: ListView.builder(
          itemCount: records.length,
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(
                  height: 1,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                ListTile(
                  title: Text(
                    '${records[position].start.toString()} - ${records[position].end.toString()}'
                  ),
                  subtitle: Text(
                    'Score: ${records[position].score}/5'
                  ),
                  leading:
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text('${records[position].id}'),
                      foregroundColor: Colors.white,
                    ),
                  onTap: () => _navigateToRecord(context, records[position]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _navigateToRecord(BuildContext context, Record record) async {
    String result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecordScreen(record))
    );
  }
}