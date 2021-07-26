import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class CoolorsScreen extends StatefulWidget {
  const CoolorsScreen({Key? key}) : super(key: key);

  @override
  _CoolorsScreenState createState() => _CoolorsScreenState();
}

class _CoolorsScreenState extends State<CoolorsScreen> {
  Random random = new Random();

  String generateRandomHexColor() {
    int length = 6;
    String chars = '0123456789ABCDEF';
    String hex = '#';
    while (length-- > 0) hex += chars[(random.nextInt(16)) | 0];
    return hex;
  }

  late String color1 = generateRandomHexColor();
  late String color2 = generateRandomHexColor();
  late String color3 = generateRandomHexColor();
  late String color4 = generateRandomHexColor();
  late String color5 = generateRandomHexColor();
  bool lock1 = false;
  bool lock2 = false;
  bool lock3 = false;
  bool lock4 = false;
  bool lock5 = false;

  Widget build(BuildContext context) {
    double paddingTop = (MediaQuery.of(context).size.height / 5) / 2;
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            ColorPallete(
              color: HexColor(color1),
            ),
            Padding(
              padding: EdgeInsets.only(top: paddingTop + 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CopyHex(color: color1),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          lock1 = !lock1;
                        });
                      },
                      child: LockIcon(ispressed: lock1)),
                ],
              ),
            ),
            TextHex(paddingTop: paddingTop, color: color1),
          ]),
          Stack(children: [
            ColorPallete(
              color: HexColor(color2),
            ),
            Padding(
              padding: EdgeInsets.only(top: paddingTop + 20),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CopyHex(color: color2),
                        SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                lock2 = !lock2;
                              });
                            },
                            child: LockIcon(ispressed: lock2)),
                      ])),
            ),
            TextHex(paddingTop: paddingTop, color: color2),
          ]),
          Stack(children: [
            ColorPallete(
              color: HexColor(color3),
            ),
            Padding(
              padding: EdgeInsets.only(top: paddingTop + 20),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CopyHex(color: color3),
                        SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                lock3 = !lock3;
                              });
                            },
                            child: LockIcon(ispressed: lock3)),
                      ])),
            ),
            TextHex(paddingTop: paddingTop, color: color3),
          ]),
          Stack(children: [
            ColorPallete(
              color: HexColor(color4),
            ),
            Padding(
              padding: EdgeInsets.only(top: paddingTop + 20),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CopyHex(color: color4),
                        SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                lock4 = !lock4;
                              });
                            },
                            child: LockIcon(ispressed: lock4)),
                      ])),
            ),
            TextHex(paddingTop: paddingTop, color: color4),
          ]),
          Stack(
            children: [
              Stack(children: [
                ColorPallete(
                  color: HexColor(color5),
                ),
                Padding(
                  padding: EdgeInsets.only(top: paddingTop + 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CopyHex(color: color5),
                          SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  lock5 = !lock5;
                                });
                              },
                              child: LockIcon(ispressed: lock5))
                        ]),
                  ),
                ),
                TextHex(paddingTop: paddingTop, color: color5),
              ]),
              Positioned(
                right: 0,
                bottom: 10,
                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    setState(() {
                      color1 = lock1 ? color1 : generateRandomHexColor();
                      color2 = lock2 ? color2 : generateRandomHexColor();
                      color3 = lock3 ? color3 : generateRandomHexColor();
                      color4 = lock4 ? color4 : generateRandomHexColor();
                      color5 = lock5 ? color5 : generateRandomHexColor();
                    });
                  },
                  child: Icon(CupertinoIcons.arrow_2_circlepath),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CopyHex extends StatelessWidget {
  const CopyHex({
    Key? key,
    required this.color,
  }) : super(key: key);
  final String color;

  @override
  Widget build(BuildContext context) {
    Future<void> _copyToClipboard(text) async {
      await Clipboard.setData(ClipboardData(text: text));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Copied to clipboard'),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        _copyToClipboard(color);
      },
      child: Icon(
        Icons.copy,
        color: Colors.white54,
      ),
    );
  }
}

class TextHex extends StatelessWidget {
  const TextHex({
    Key? key,
    required this.paddingTop,
    required this.color,
  }) : super(key: key);

  final double paddingTop;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop - 35),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          color.substring(1),
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}

class ColorPallete extends StatefulWidget {
  ColorPallete({required this.color});
  final Color color;

  @override
  _ColorPalleteState createState() => _ColorPalleteState();
}

class _ColorPalleteState extends State<ColorPallete> {
  @override
  bool pressed = false;
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: widget.color,
        height: MediaQuery.of(context).size.height / 5,
      ),
    ]);
  }
}

class LockIcon extends StatelessWidget {
  const LockIcon({
    Key? key,
    required this.ispressed,
  }) : super(key: key);
  final bool ispressed;

  @override
  Widget build(BuildContext context) {
    return Icon(
      ispressed ? CupertinoIcons.lock : CupertinoIcons.lock_open,
      color: ispressed ? Colors.white : Colors.white54,
    );
  }
}
