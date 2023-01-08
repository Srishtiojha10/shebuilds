import 'package:example/settings.dart';
import 'package:flutter/material.dart';
import 'package:gpt_3_dart/gpt_3_dart.dart';
import 'package:flutter/services.dart';

class TranslateCode extends StatefulWidget {
  final OpenAI openAI;
  TranslateCode(this.openAI);
  @override
  _TranslateCodeState createState() => _TranslateCodeState(openAI: openAI);
}

class _TranslateCodeState extends State<TranslateCode> {
  OpenAI openAI;
  _TranslateCodeState({@required this.openAI});
  final promptController = TextEditingController();
  final tokenController = TextEditingController();
  String generated = "";
  int tokens = 43;

  bool _isLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
          title: Text("Translate"),
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
                    hintText:
                        "From one programming language to another language",
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
                    child: Text('Translate'),
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
                      child: Text("The output will be here. \n\n\n\n\n\n\n"),
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
            SizedBox(
              height: 15,
            )
          ],
        ));
  }
}
