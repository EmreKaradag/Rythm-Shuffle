import 'package:flutter/material.dart';

class RestartButton extends StatefulWidget {
  final Function onChange;
  final bool replayStatus;
  const RestartButton(
      {required this.replayStatus, required this.onChange, Key? key})
      : super(key: key);

  @override
  State<RestartButton> createState() => _RestartButtonState();
}

class _RestartButtonState extends State<RestartButton> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor2 = Colors.grey.shade500;
    Color backgroundColor1 = Colors.grey.shade700;

    return Transform.scale(
      scale: widget.replayStatus ? 1 : 1.1,
      child: FloatingActionButton(
          elevation: widget.replayStatus ? 0.5 : null,
          backgroundColor:
              widget.replayStatus ? backgroundColor1 : backgroundColor2,
          child: Icon(Icons.replay, color: Colors.grey.shade200),
          onPressed: widget.replayStatus
              ? null
              : () {
                  widget.onChange([true, false]);
                }),
    );
  }
}
