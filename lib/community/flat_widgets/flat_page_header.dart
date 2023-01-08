import 'package:flutter/material.dart';

class FlatPageHeader extends StatelessWidget {
  final String title;
  final double textSize;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final Color textColor;
  final Widget suffixWidget;
  final Widget prefixWidget;
  FlatPageHeader(
      {this.title,
      this.textSize,
      this.fontWeight,
      this.backgroundColor,
      this.textColor,
      this.suffixWidget,
      this.prefixWidget});

  @override
  Widget build(BuildContext context) {
    double paddingRight() {
      if (suffixWidget == null) {
        return 24.0;
      } else {
        return 16.0;
      }
    }

    double paddingLeft() {
      if (prefixWidget == null) {
        return 24.0;
      } else {
        return 16.0;
      }
    }

    double headerPadding() {
      if (prefixWidget == null) {
        return 0.0;
      } else {
        return 8.0;
      }
    }

    Color _backgroundColor() {
      if (backgroundColor != null) {
        return backgroundColor;
      } else {
        return Theme.of(context).primaryColorLight;
      }
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: headerPadding(),
                    ),
                    child: Text(
                      "Code Community" ?? "Header",
                      style: TextStyle(
                          color:
                              textColor ?? Theme.of(context).primaryColorDark,
                          fontSize: textSize ?? 30.0,
                          fontWeight: fontWeight ?? FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: suffixWidget,
            ),
          ],
        ),
      ),
    );
  }
}
