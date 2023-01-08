import 'package:example/code_editor/html_code_editor.dart';
import 'package:example/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pluto_code_editor/pluto_code_editor.dart';
import 'package:flutter_highlight/themes/an-old-hope.dart';

import 'dart:async';
import 'package:flutter/material.dart';

class CppCodeEditorScreen extends StatefulWidget {
  const CppCodeEditorScreen({Key key}) : super(key: key);

  @override
  State<CppCodeEditorScreen> createState() => _CppCodeEditorScreenState();
}

class _CppCodeEditorScreenState extends State<CppCodeEditorScreen> {
  PlutoCodeEditorController controller = PlutoCodeEditorController(
      theme: EditorTheme(syntaxTheme: anOldHopeTheme));
  StreamController streamController = StreamController.broadcast();
  bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Code Editor"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              icon: Icon(Icons.code_rounded, color: Colors.white, size: 25.0),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HtmlCodeEditorScreen()));
              }),
        ],
      ),
      endDrawer: PlutoOutputViewer(
        controller: controller,
        output: streamController.stream,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: PlutoCodeEditor(
          controller: controller,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: PlutoEditorBottomBar(
        controller: controller,
        keys: const [
          ':',
          '#',
          '(',
          ')',
          '[',
          ']',
          '.',
          "'",
        ],
        onCodeRun: () {
          isRunning = true;
          void showHelloWorld() async {
            if (!isRunning) return;
            streamController.sink.add("Hello world\n");
            await Future.delayed(const Duration(milliseconds: 200));
            showHelloWorld();
          }

          showHelloWorld();
        },
        onPause: () {
          isRunning = false;
        },
      ),
    );
  }
}
