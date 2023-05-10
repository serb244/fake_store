import 'dart:async';

class TimerOnPage {
  static Stream<int> getTime() async* {
    Timer? timer;
    int time = 0;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      time++;
    });
    yield time;
  }
}
