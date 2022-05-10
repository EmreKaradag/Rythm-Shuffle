import 'package:flutter/material.dart';

import 'Data/data.dart';

class NoteCard extends StatefulWidget {
  int noteNumber;
  bool big;

  NoteCard({required this.big, required this.noteNumber, Key? key})
      : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  double width = 100;
  double height = 150;
  double padding = 22;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.big) {
      width = width + 25;
      height = height + 25;
      padding = 10;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Column(
        children: [
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.all(Data.valuePadding[widget.noteNumber]),
                    child: SizedBox(
                      
                      child: Image.asset(Data.images[widget.noteNumber]),
                    ),
                  ),
                ],
              ),
            ),
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Data.boxColor[widget.noteNumber]),
          ),
        ],
      ),
    );
  }
}
