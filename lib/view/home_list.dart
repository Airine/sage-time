
import 'package:flutter/material.dart';
import 'package:sage_time/model/record.dart';
import 'package:sage_time/util/db_connection.dart';
import 'package:sage_time/view/record_page.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => new _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List<Record> records = new List<Record>();
  DatabaseHelper db = new DatabaseHelper();

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
      child: ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, position) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  '${records[position].start.toString()} - ${records[position].end.toString()}'
                ),
                subtitle: Text(
                  'Score: ${records[position].score}/5'
                ),
                leading: Text(
                  '${records[position].id}'
                ),
                onTap: () => _navigateToRecord(context, records[position]),
              ),

            ],
          );
        },
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