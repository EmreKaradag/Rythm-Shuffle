import 'dart:async';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:rhytm2/Data/data_helper.dart';

import 'Constants/constants.dart';

class Metronome extends StatefulWidget {
  int currentValue;
  final bool playStatus;
  final bool optionsChange;
  Function onSpeedChange;

  Metronome(
      {required this.optionsChange,
      required this.playStatus,
      required this.onSpeedChange,
      required this.currentValue,
      Key? key})
      : super(key: key);

  @override
  State<Metronome> createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> {
  @override
  Widget build(BuildContext context) {
    bool widgetStatus = widget.playStatus && widget.optionsChange;

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(
        'BPM',
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
            
              decoration: BoxDecoration(
                  /*   border: Border(
                      bottom: BorderSide(
                          color: widgetStatus
                              ? Colors.grey.shade600
                              : Colors.grey.shade500)) */
                  ),
              textStyle: Constants.unselectedNumber,
              selectedTextStyle: Constants.selectedNumber,
              itemHeight: 42,
              itemWidth: 42,
              step: 1,
              axis: Axis.horizontal,
              minValue: 1,
              maxValue: 200,
              value: widget.currentValue,
              onChanged: (value) {
                setState(() {
                  widget.currentValue = value;

                  return widget.onSpeedChange(value);
                });
              }),
        ),
      ),
    ]);
  }
}
