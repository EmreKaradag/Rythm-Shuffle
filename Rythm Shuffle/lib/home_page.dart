import 'dart:async';
import 'dart:isolate';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rhytm2/Data/data_helper.dart';
import 'package:rhytm2/difficulty.dart';
import 'package:rhytm2/metronome.dart';
import 'package:rhytm2/note_card.dart';
import 'package:rhytm2/restart_button.dart';
import 'package:rhytm2/stop_button.dart';

import 'Data/data.dart';
import 'play_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool playValue;
  late bool pauseValue;
  late bool replayValue;
  late bool optionsChange;
  late List<int> cardList;
  late AudioCache audioCache;

  late final ReceivePort receivePort;

  //
  int currentBPMValue = 60;
  int currentDifficultyLevel = 3;
  int iteration = 0;
  int seconds = 1;

  //
  //

  //
  Timer? timer1;
  Timer? timer2;

  int timerMiliseconds = 1000;
  int timerSeconds = 60;

  void initState() {
    // TODO: implement initState
    cardList = DataHelper.generateCardsOG(currentDifficultyLevel);
    playValue = false;
    pauseValue = true;
    replayValue = false;
    optionsChange = true;
    audioCache = AudioCache();
  }

  @override
  @override
  @override
  void Timer1Start(int timerMiliseconds) {
    timer1 = Timer.periodic(Duration(milliseconds: timerMiliseconds), (timer) {
      setState(() {
        audioCache.play(Data.sound);
        debugPrint('iteration : $iteration');
        iteration = iteration + 1;
        timerSeconds = timerSeconds - 1;
        debugPrint('iteration :$iteration');
        debugPrint('${DataHelper.cards.length}');
        if (iteration == 496) {
          Timer1Stop(timer);
          replayValue = false;
          pauseValue = true;
          playValue = true;
          //cardList.add(DataHelper.listPartsForExtending[currentDifficultyLevel]());

        }
      });
    });
  }

  void Timer1Stop(Timer timer) {
    timer.cancel();
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                  color: Colors.grey.shade900,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                              color: Colors.grey.shade900,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        color: Colors.grey.shade900,
                                      )),
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                          color: Colors.grey.shade900,
                                          child: Metronome(
                                              optionsChange: optionsChange,
                                              playStatus: playValue,
                                              onSpeedChange: (value) {
                                                setState(() {
                                                  currentBPMValue = value;
                                                  timerMiliseconds =
                                                      DataHelper.TimeHandler(
                                                          value);
                                                  debugPrint(
                                                      'timerSeconds :$timerSeconds');
                                                  debugPrint(
                                                      'timerMiliseconds :$timerMiliseconds');
                                                });
                                              },
                                              currentValue: currentBPMValue))),
                                ],
                              ))),
                      Expanded(
                          flex: 4,
                          child: Container(
                              color: Colors.grey.shade900,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(flex: 5, child: Buttons()),
                                ],
                              ))),
                      Expanded(
                          flex: 2,
                          child: Container(
                              color: Colors.grey.shade900,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                          color: Colors.grey.shade900,
                                          child: Row(
                                            children: [],
                                          ))),
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                          color: Colors.grey.shade900,
                                          child: Difficulty(
                                              optionsChange: optionsChange,
                                              playStatus: playValue,
                                              onDifficultyChange: (diffValue) {
                                                setState(() {
                                                  currentDifficultyLevel =
                                                      diffValue;
                                                  playValue = true;
                                                  optionsChange = false;
                                                  debugPrint(
                                                      'zorluk:$currentDifficultyLevel');
                                                });
                                              },
                                              DiffValue:
                                                  currentDifficultyLevel))),
                                ],
                              ))),
                    ],
                  ))),
          Expanded(
              flex: 5,
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey.shade900,
                  child: Container(child: Notes(cardList, iteration)))),
        ],
      ),
    );
  }

  Container Buttons() {
    return Container(
        color: Colors.grey.shade900,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 105, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlayButton(
                  playStatus: playValue,
                  onChange: (value) {
                    setState(() {
                      playValue = value[0];
                      pauseValue = value[1];
                      replayValue = value[0];
                      optionsChange = true;

                      debugPrint('playvalue:$playValue');
                      debugPrint('pausevalue:$pauseValue');
                      debugPrint('replayvalue:$pauseValue');
                      Timer1Start(timerMiliseconds);
                    });
                  }),
              StopButton(
                stopStatus: pauseValue,
                onChange: (value) {
                  setState(() {
                    pauseValue = value[0];
                    playValue = value[1];
                    replayValue = value[1];
                    optionsChange = false;
                    debugPrint('pause basıldı');
                    debugPrint('playvalue:$playValue');
                    debugPrint('pausevalue:$pauseValue');
                    debugPrint('replayvalue:$pauseValue');
                    Timer1Stop(timer1!);
                  });
                },
              ),
              RestartButton(
                  replayStatus: replayValue,
                  onChange: (value) {
                    setState(() {
                      replayValue = value[1];
                      pauseValue = value[0];
                      playValue = value[1];
                      debugPrint('replay basıldı');
                      debugPrint('playvalue:$playValue');
                      debugPrint('pausevalue:$pauseValue');
                      debugPrint('replayvalue:$pauseValue');
                      debugPrint('replay yeni liste yarattı');
                      iteration = 0;
                      cardList.clear();
                      cardList =
                          DataHelper.generateCardsOG(currentDifficultyLevel);
                    });
                  })
            ],
          ),
        ));
  }

  Widget Notes(List cardlist, int iteration) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NoteCard(
          noteNumber: cardList[0 + iteration],
          big: true,
        ),
        NoteCard(noteNumber: cardList[1 + iteration], big: false),
        NoteCard(noteNumber: cardList[2 + iteration], big: false),
        NoteCard(noteNumber: cardList[3 + iteration], big: false),
      ],
    );
  }
}
