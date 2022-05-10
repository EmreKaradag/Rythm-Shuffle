import 'package:flutter/material.dart';

class StopButton extends StatefulWidget {
  final Function onChange;
  final bool stopStatus;

  const StopButton({required this.stopStatus, required this.onChange, Key? key})
      : super(key: key);

  @override
  State<StopButton> createState() => _StopButtonState();
}

class _StopButtonState extends State<StopButton> {
  Color backgroundColor2 = Colors.grey.shade500;
  Color backgroundColor1 = Colors.grey.shade700;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.stopStatus ? 1 : 1.1,
      child: FloatingActionButton(
          elevation: widget.stopStatus ? 0 : null,
          enableFeedback: false,
          backgroundColor:
              widget.stopStatus ? backgroundColor1 : backgroundColor2,
          child: Icon(
            Icons.stop,
            color: Colors.grey.shade200,
          ),
          onPressed: widget.stopStatus
              ? null
              : () {
                  setState(() {
                    widget.onChange([true, false]);
                  });
                }),
    );
  }
}
