import 'package:rxdart/rxdart.dart';

class Favourites {
  BehaviorSubject<int> subjectCounter = BehaviorSubject.seeded(0);

  int get current => subjectCounter.value;

  increment() {
    subjectCounter.add(current + 1);
  }

  decrement() {
    subjectCounter.add(current - 1);
  }
}
