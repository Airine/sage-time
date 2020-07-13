import 'package:flutter/material.dart';
import 'package:sage_time/model/record.dart';
import 'package:sage_time/util/db_connection.dart';

class RecordScreen extends StatefulWidget {
  final Record record;
  RecordScreen(this.record);

  @override
  State<StatefulWidget> createState() => new _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  DatabaseHelper db = new DatabaseHelper();

//  TextEditingController _titleController;
//  TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();

//    _titleController = new TextEditingController(text: widget.record.title);
//    _descriptionController = new TextEditingController(text: widget.record.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Note')),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              '${widget.record.id}'
            ),
//            TextField(
//              controller: _titleController,
//              decoration: InputDecoration(labelText: 'Title'),
//            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            Text(
              '${widget.record.start.toString()} - ${widget.record.end.toString()}'
            ),
//            Padding(padding: new EdgeInsets.all(5.0)),
//            RaisedButton(
//              child: (widget.record.id != null) ? Text('Update') : Text('Add'),
//              onPressed: () {
//                if (widget.record.id != null) {
//                  db.updateNote(Note.fromMap({
//                    'id': widget.record.id,
//                    'title': _titleController.text,
//                    'description': _descriptionController.text
//                  })).then((_) {
//                    Navigator.pop(context, 'update');
//                  });
//                }else {
//                  db.saveNote(Note(_titleController.text, _descriptionController.text)).then((_) {
//                    Navigator.pop(context, 'save');
//                  });
//                }
//              },
//            ),
          ],
        ),
      ),
    );
  }
}
