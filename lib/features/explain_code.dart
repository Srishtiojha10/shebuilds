import 'package:example/settings.dart';
import 'package:flutter/material.dart';
import 'package:gpt_3_dart/gpt_3_dart.dart';
import 'package:flutter/services.dart';

class ExplainCode extends StatefulWidget {
  final OpenAI openAI;
  ExplainCode(this.openAI);
  @override
  _ExplainCodeState createState() => _ExplainCodeState(openAI: openAI);
}

class _ExplainCodeState extends State<ExplainCode> {
  OpenAI openAI;
  _ExplainCodeState({@required this.openAI});
  final promptController = TextEditingController();
  final tokenController = TextEditingController();
  String generated = "";
  int tokens = 64;

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
          title: Text("Explain"),
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
              height: MediaQuery.of(context).size.height * 0.4,
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
                    hintText: "Enter code",
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            _isLoading
                ? LinearProgressIndicator()
                : MaterialButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      String complete = await openAI.complete(
                          '${promptController.text}', tokens);
                      setState(() {
                        generated = complete;
                        _isLoading = false;
                      });
                    },
                    child: Text('Explain code'),
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
                      child: Text("Explaination will be here. \n\n\n\n\n\n\n"),
                    ))
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      child: Text("1. ${generated}\n\n"),
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
