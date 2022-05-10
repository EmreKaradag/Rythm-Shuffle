import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  final Function onChange;
  final bool playStatus;

  const PlayButton({required this.playStatus, required this.onChange, Key? key})
      : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor2 = Colors.grey.shade500;
    Color backgroundColor1 = Colors.grey.shade700;

    return Transform.scale(
      scale: widget.playStatus ? 1 : 1.1,
      child: FloatingActionButton(
          enableFeedback: false,
          elevation: widget.playStatus ? 0 : null,
          backgroundColor:
              (widget.playStatus) ? backgroundColor1 : backgroundColor2,
          child: Icon(
            Icons.play_arrow,
            color: Colors.grey.shade200,
          ),
          onPressed: (widget.playStatus)
              ? null
              : () {
                  setState(() {
                    widget.onChange([true, false]);
                  });
                }),
    );
  }
}
