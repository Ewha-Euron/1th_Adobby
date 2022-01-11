import 'package:adobby/widgets/Diary.dart';
import 'package:adobby/widgets/TextDiaryAddPic.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var diary = new Diary();
String initialText = 'diary.line';

class DetailScreen extends StatefulWidget {
  //const DetailScreen({Key? key}) : super(key: key);

  DetailScreen({Key? key, required detailedDiary}) {
    diary = detailedDiary;
  }

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool editMode = false;

  TextEditingController _editingController =
      TextEditingController(text: initialText);

  Widget _editTitleTextField() {
    if (editMode)
      return Center(
          child: Container(
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              initialText = newValue;
              diary.line = initialText;
              editMode = false;
            });
          },
          autofocus: true,
          controller: _editingController,
        ),
      ));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        initialText,
        style: TextStyle(fontSize: 19.0),
      ),
      IconButton(
          onPressed: () {
            setState(() {
              editMode = true;
            });
          },
          icon: Icon(Icons.edit))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[200],
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[400]),
              ),
              Text(
                DateFormat.E().format(DateTime.now()),
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                diary.title,
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              _editTitleTextField(),
              SizedBox(
                height: 20,
              ),
              Container(
                width: width - 80,
                child: Text(
                  diary.text,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ));
  }
}
