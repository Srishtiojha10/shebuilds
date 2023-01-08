import 'package:example/code_editor/code_editor.dart';
import 'package:example/community/screens/homepage.dart';
import 'package:example/features/calculate_time.dart';
import 'package:example/features/explain_code.dart';
import 'package:example/features/generate_code.dart';
import 'package:example/features/translate.dart';
import 'package:flutter/material.dart';
import 'package:gpt_3_dart/gpt_3_dart.dart';

class Home extends StatefulWidget {
  final OpenAI openAI;
  Home(this.openAI);
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  int localcollegeid = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [
      GenerateCode(widget.openAI),
      ExplainCode(widget.openAI),
      CalculateTime(widget.openAI),
      // CppCodeEditorScreen(),
      //TranslateCode(widget.openAI),
      // Homepage(),
    ];
    return Scaffold(
      body: _children.isNotEmpty
          ? _children[_currentIndex]
          : CircularProgressIndicator(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: new Border(
            top: new BorderSide(
                color: Colors.grey, width: 0.3, style: BorderStyle.solid),
          ),
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.grey[500],
          selectedItemColor: Colors.blueAccent[700],
          //backgroundColor: Colors.grey[300],
          onTap: onTabTapped, // new
          currentIndex: _currentIndex, // new
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.code_rounded),
              label: ('Generate Code'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.laptop_windows_rounded),
              label: ('Explain Code'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_rounded),
              label: ('Complexity'),
            ),
            // new BottomNavigationBarItem(
            //   icon: Icon(Icons.swap_horiz_rounded),
            //   label: ('Translate'),
            // ),
            // new BottomNavigationBarItem(
            //   icon: Icon(Icons.developer_mode),
            //   label: ('Code Editor'),
            // ),
            // new BottomNavigationBarItem(
            //   icon: Icon(Icons.people),
            //   label: ('Community'),
            // ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
