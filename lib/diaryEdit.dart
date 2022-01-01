import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class DiaryEdit extends StatefulWidget {
  const DiaryEdit({Key? key}) : super(key: key);

  @override
  State<DiaryEdit> createState() => _DiaryEditState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DiaryEditState extends State<DiaryEdit> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('하루, 한 줄'),
      elevation: 0.0,
      backgroundColor: Color(0xff6667ab),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: TextFormField(
            validator: (value) {
              Pattern sentencePattern = r'^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣0-9]{2,6}$';
            },
            cursorColor: Color(0xff6667ab),
            style: TextStyle(color: Colors.black),
            controller: _controller,
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Color(0xff6667ab), width: 0.0),),
                fillColor: Color(0xff6667ab),
                iconColor: Color(0xff6667ab),
                labelText: '한 줄 일기',
                helperText: '인공지능이 쓴 한 줄 일기를 수정해주세요',
                hintText: '활활 타오르는 난로 불을 보고 밥 먹고 운동까지 알차게 끝낸 하루!',  // original inferenced result
                icon: Icon(Icons.mode_edit, color: Color(0xff6667ab)),
                border: OutlineInputBorder(), 
                contentPadding: EdgeInsets.all(3)
            ),

            onFieldSubmitted: (String value) async {
              await showDialog<void>(
                barrierColor: Colors.black,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thanks!'),
                    content: Text(
                        'You typed "$value", which has length ${value.characters.length}.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(fontSize: 10.0,
                          color: Colors.black),
                          ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}