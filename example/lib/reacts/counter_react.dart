import 'dart:async';

import 'package:reactive/reactive.dart';

enum CounterAction {Increment, Decrement, Reset}
class CounterBase implements ReactBase {
 int _value = 0;
  int get value => _value;

  final StreamController<int> _controller =  StreamController<int>.broadcast();
  StreamSink<int> get _counterSink => _controller.sink;
  Stream<int> get counterStream => _controller.stream;

  final eventController = StreamController<CounterAction>();
 StreamSink<CounterAction> get eventSink => eventController.sink;
 Stream<CounterAction> get eventStream => eventController.stream;

 CounterBase() {
   if (_value == null) {
     _value = 0;
     _counterSink.add(_value);
   }
   eventStream.listen((event) {
     switch (event) {
       case CounterAction.Increment:
         _value++;
         print("increment");
         break;
       case CounterAction.Decrement:
         _value--;
         print("decrement");
         break;
       case CounterAction.Reset:
         _value = 0;
         print("reset");
         break;
       default:
         _value = 0;
     }
     _counterSink.add(_value);
   });
 }
  @override
  void dispose() {
    _controller.close();
    eventController.close();
  }

}
