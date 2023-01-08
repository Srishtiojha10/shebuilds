import 'package:example/settings.dart';
import 'package:flutter/material.dart';
import 'package:gpt_3_dart/gpt_3_dart.dart';
import 'package:flutter/services.dart';

class GenerateCode extends StatefulWidget {
  final OpenAI openAI;
  GenerateCode(this.openAI);
  @override
  _GenerateCodeState createState() => _GenerateCodeState(openAI: openAI);
}

class _GenerateCodeState extends State<GenerateCode> {
  OpenAI openAI;
  _GenerateCodeState({@required this.openAI});
  final promptController = TextEditingController();
  final tokenController = TextEditingController();
  String generated = "";
  int tokens = 282;

  bool _isLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Future<void> _copyToClipboard(String copiedtext) async {
    await Clipboard.setData(ClipboardData(text: copiedtext));
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text('Copied to clipboard'),
    // ));
  }

  @override
  void dispose() {
    promptController.dispose();
    tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Jarvis"),
          actions: [
            IconButton(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                icon: Icon(Icons.settings, color: Colors.white, size: 25.0),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                }),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.0),
          children: [
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: promptController,
                  decoration: InputDecoration(
                    hintText: "Enter description",
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            // TextField(
            //   controller: tokenController,
            //   decoration: InputDecoration(
            //     hintText: "Enter max tokens (default is 300)",
            //   ),
            //   onChanged: (String value) => {tokens = int.parse(value)},
            // ),
            // SizedBox(height: 15),
            _isLoading
                ? LinearProgressIndicator()
                : MaterialButton(
                    onPressed: () async {
                      print('do');
                      setState(() {
                        _isLoading = true;
                      });
                      print('do1');
                      String complete = await openAI.complete(
                          '""" ${promptController.text} """', tokens);
                      print('do2');
                      print(complete);
                      setState(() {
                        generated = complete;
                        _isLoading = false;
                      });
                    },
                    child: Text('Generate code'),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                  ),
            SizedBox(height: 25),
            generated == ""
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      child: Text(
                          "Output code will be here. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"),
                    ))
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      child: Text("${generated}\n\n"),
                    )),

            generated == ""
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 40),
                    child: MaterialButton(
                      onPressed: () {
                        _copyToClipboard(generated);
                      },
                      child: Text("Copy to clipboard"),
                      color: Colors.blueGrey,
                      textColor: Colors.white,
                    ),
                  ),
          ],
        ));
  }
}
