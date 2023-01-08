import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white70)),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Divider(
                color: Colors.white,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Made with love by Team Jarvis",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        TextSpan(
                            text: "",
                            style: TextStyle(
                                color: Colors.blueAccent[400],
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                launch('https://www.instagram.com/');
                              }),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 70,
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                ),
                child: MaterialButton(
                  elevation: 4,
                  color: Colors.deepOrange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.message_rounded,
                        color: Colors.white,
                        size: 25.0,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Suggest New Features",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onPressed: () {
                    launch(
                        "https://api.whatsapp.com/send?phone=918800209871&text=Hey,%20my%20wishlist%20features%20for%20the%20Jarvis%20app%20is...%20(Write%20your%20suggestions%20and%20the%20features%20you%20would%20like%20to%20see)");
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                ),
                child: MaterialButton(
                  elevation: 4,
                  color: Color(0xFF03DACC),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.bug_report_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Report Bugs",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onPressed: () {
                    launch(
                        "mailto:jarvis@gmail.com?subject=Reporting in App Bugs&body=(Please describe and provide screenshot or screenrecording of the issue)");
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                ),
                child: MaterialButton(
                  elevation: 4,
                  color: Color(0xFFBB86FF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.share_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Share with Friends",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onPressed: () {
                    Share.share(
                        "Heyyyy, try this Jarvis App, which helps you code! It's an AI assitant for developers and it's magical!",
                        subject: "Jarvis App!");
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                ),
                child: MaterialButton(
                  elevation: 4,
                  color: Colors.blueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.language_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "About Codex",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onPressed: () {
                    launchURL("https://openai.com/blog/openai-codex/");
                  },
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ],
      ),
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
