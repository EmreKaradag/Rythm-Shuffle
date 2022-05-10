import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'Constants/constants.dart';

class Difficulty extends StatefulWidget {
  int DiffValue = 3;
  Function onDifficultyChange;
  final bool playStatus;
  final bool optionsChange;

  Difficulty(
      {required this.optionsChange,
      required this.playStatus,
      required this.onDifficultyChange,
      required this.DiffValue,
      Key? key})
      : super(key: key);

  @override
  State<Difficulty> createState() => _DifficultyState();
}

class _DifficultyState extends State<Difficulty> {
  @override
  Widget build(BuildContext context) {
    bool widgetStatus = widget.playStatus && widget.optionsChange;
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(
        'Difficulty',
        style: widgetStatus
            ? Constants.titlesUnSelectable
            : Constants.titlesSelectable,
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: IgnorePointer(
          ignoring: widgetStatus,
          child: NumberPicker(
              textStyle: Constants.unselectedNumber,
              selectedTextStyle: Constants.selectedNumber,
              itemHeight: 42,
              itemWidth: 42,
              step: 1,
              axis: Axis.horizontal,
              minValue: 1,
              maxValue: 5,
              value: widget.DiffValue,
              onChanged: (value) {
                setState(() {
                  widget.DiffValue = value;
                  return widget.onDifficultyChange(value);
                });
              }),
        ),
      ),
    ]);
  }
}
