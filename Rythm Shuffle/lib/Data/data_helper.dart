import 'dart:math';

class DataHelper {
  static Random random = Random();

  static List<int> cards = generateCards();

  static List<int> generateCards() {
    return List.generate(500, (index) => random.nextInt(4));
  }

  static final List<Function> listPartsForExtending = [
    diff1rest,
    diff2rest,
    diff3rest,
    diff4rest,
    diff5rest
  ];

  static int TimeHandler(int bpmValue) {
    int miliseconds = ((60 / bpmValue) * 1000).round();
    return miliseconds;
  }

  static List<int> generateCardsOG(int difficultyLevel) {
    switch (difficultyLevel) {
      case 1:
        var part1 = [1, 1];
        var part2 = DataHelper.diff1part1();
        var part3 = DataHelper.diff1part2();
        var part4 = DataHelper.diff1rest();
        var part5 = [0, 0, 0, 0];
        part1.addAll(part2);
        part1.addAll(part3);
        part1.addAll(part4);
        return part1;
      //diff1list
      case 2:
        var part1 = [1, 1];
        var part2 = DataHelper.diff2part1();
        var part3 = DataHelper.diff2part2();
        var part4 = DataHelper.diff2part3();
        var part5 = DataHelper.diff2rest();
        var part6 = [0, 0, 0, 0];
        part1.addAll(part2);
        part1.addAll(part3);
        part1.addAll(part4);
        part1.addAll(part5);
        part1.addAll(part6);
        return part1;
      //return diff2list();
      case 3:
        var part1 = [1, 1];
        var part2 = DataHelper.diff3part1();
        var part3 = DataHelper.diff3part2();
        var part4 = DataHelper.diff3rest();
        var part5 = [0, 0, 0, 0];
        part1.addAll(part2);
        part1.addAll(part3);
        part1.addAll(part4);
        part1.addAll(part5);
        return part1;
      //return diff3list();
      case 4:
        var part1 = [1, 1];
        var part2 = DataHelper.diff4part1();
        var part3 = DataHelper.diff4part2();
        var part4 = DataHelper.diff4rest();
        var part5 = [0, 0, 0, 0];
        part1.addAll(part2);
        part1.addAll(part3);
        part1.addAll(part4);
        part1.addAll(part5);
        return part1;
      //return diff4list();

      case 5:
        var part1 = [1, 1];
        var part2 = DataHelper.diff5part1();
        var part3 = DataHelper.diff5rest();
        var part4 = [0, 0, 0, 0];
        part1.addAll(part2);
        part1.addAll(part3);
        part1.addAll(part4);
        return part1;
      //return diff5list();
      default:
        return [0];
    }
  }

  static List<int> diff5list() {
    return List.generate(100, (index) => 5);
  }

  static List<int> diff4list() {
    return List.generate(100, (index) => 4);
  }

  static List<int> diff3list() {
    return List.generate(100, (index) => 3);
  }

  static List<int> diff2list() {
    return List.generate(100, (index) => 2);
  }

  static List<int> diff1list() {
    return List.generate(100, (index) => 1);
  }

  static List<int> diff1part1() {
    return List.generate(8, (index) => random.nextInt(4) <= 3 ? 1 : 0);
  }

  static List<int> diff1part2() {
    return List.generate(10, (index) {
      var temp = random.nextInt(100);
      if (temp < 50) {
        return 1;
      } else if (temp < 75 && temp >= 50) {
        return 2;
      } else {
        return 0;
      }
    });
  }

  static List<int> diff1rest() {
    var temp;
    return List.generate(476, (index) {
      temp = random.nextInt(100);
      if (temp < 45) {
        return 1;
      } else if (temp >= 45 && temp < 90) {
        return 2;
      } else {
        return 0;
      }
    });
  }

  static List<int> diff2part1() {
    return List.generate(10, (index) => random.nextInt(4) <= 3 ? 1 : 0);
  }

  static List<int> diff2part2() {
    var temp;
    return List.generate(5, (index) {
      temp = random.nextInt(100);
      if (temp < 45) {
        return 1;
      } else if (temp >= 45 && temp < 90) {
        return 2;
      } else {
        return 0;
      }
    });
  }

  static List<int> diff2part3() {
    var temp;
    return List.generate(10, (index) {
      temp = random.nextInt(100);
      if (temp < 35) {
        return 1;
      } else if (temp >= 35 && temp < 70) {
        return 2;
      } else if (temp <= 70 && temp < 90) {
        return 3;
      } else {
        return 0;
      }
    });
  }

  static List<int> diff2rest() {
    var temp;
    return List.generate(466, (index) {
      temp = random.nextInt(100);
      if (temp < 35) {
        return 1;
      } else if (temp >= 35 && temp < 70) {
        return 2;
      } else if (temp <= 70 && temp < 90) {
        return 3;
      } else {
        return 0;
      }
    });
  }

  static List<int> diff3part1() {
    var temp;
    return List.generate(8, (index) {
      temp = random.nextInt(100);
      if (temp < 50) {
        return 1;
      } else if (temp >= 50 && temp < 80) {
        return 2;
      } else {
        return 0;
      }
    });
  }

  static List<int> diff3part2() {
    var temp;
    return List.generate(10, (index) {
      temp = random.nextInt(100);
      if (temp < 30) {
        return 1;
      } else if (temp >= 30 && temp < 60) {
        return 2;
      } else if (temp >= 60 && temp < 90) {
        return 3;
      } else {
        return 0;
      }
    });
  }

  static List<int> diff3rest() {
    var temp;
    return List.generate(476, (index) {
      temp = random.nextInt(1000);
      if (temp < 225) {
        return 1;
      } else if (temp >= 225 && temp < 450) {
        return 2;
      } else if (temp >= 450 && temp < 675) {
        return 3;
      } else if (temp >= 675 && temp < 900) {
        return 4;
      } else {
        return 5;
      }
    });
  }

  static List<int> diff4part1() {
    var temp;
    return List.generate(8, (index) {
      temp = random.nextInt(100);
      if (temp < 30) {
        return 1;
      } else if (temp >= 30 && temp < 60) {
        return 2;
      } else if (temp >= 60 && temp < 90) {
        return 3;
      } else {
        return 0;
      }
    });
  }

  static List<int> diff4part2() {
    var temp;
    return List.generate(5, (index) {
      temp = random.nextInt(100);
      if (temp < 18) {
        return 1;
      } else if (temp >= 18 && temp < 36) {
        return 2;
      } else if (temp >= 36 && temp < 54) {
        return 3;
      } else if (temp >= 54 && temp < 72) {
        return 4;
      } else if (temp >= 72 && temp < 90) {
        return 5;
      } else {
        return 0;
      }
    });
  }

  static List<int> diff4rest() {
    var temp;
    return List.generate(481, (index) {
      temp = random.nextInt(100);
      if (temp < 15) {
        return 1;
      } else if (temp >= 15 && temp < 30) {
        return 2;
      } else if (temp >= 30 && temp < 45) {
        return 3;
      } else if (temp >= 45 && temp < 60) {
        return 4;
      } else if (temp >= 60 && temp < 75) {
        return 5;
      } else if (temp >= 75 && temp < 90) {
        return 6;
      } else {
        return 0;
      }
    });
  }

  static List<int> diff5part1() {
    var temp;
    return List.generate(8, (index) {
      temp = random.nextInt(100);
      if (temp < 18) {
        return 1;
      } else if (temp >= 18 && temp < 36) {
        return 2;
      } else if (temp >= 36 && temp < 54) {
        return 3;
      } else if (temp >= 54 && temp < 72) {
        return 4;
      } else if (temp >= 72 && temp < 90) {
        return 5;
      } else {
        return 0;
      }
    });
  }

  static List<int> diff5rest() {
    var temp;
    return List.generate(486, (index) {
      temp = random.nextInt(1000);
      if (temp < 125) {
        return 1;
      } else if (temp >= 125 && temp < 250) {
        return 2;
      } else if (temp >= 250 && temp < 375) {
        return 3;
      } else if (temp >= 375 && temp < 500) {
        return 4;
      } else if (temp >= 500 && temp < 625) {
        return 5;
      } else if (temp >= 625 && temp < 750) {
        return 6;
      } else if (temp >= 750 && temp < 875) {
        return 7;
      } else {
        return 0;
      }
    });
  }

  static List<int> sus() {
    return List.generate(4, (index) => 0);
  }
}
