import 'dart:async';

import 'package:example/models/counter_model.dart';
import 'package:reactive/reactive.dart';
class CounterBase implements ReactBase {
  CounterModel _value = CounterModel(
     value: 0,
    createdAt: DateTime.now(),
  );
  CounterModel get value => _value;

  final StreamController<CounterModel> _controller =  StreamController<CounterModel>.broadcast();
  StreamSink<CounterModel> get _counterSink => _controller.sink;
  Stream<CounterModel> get counterStream => _controller.stream;
  CounterBase(){
    _counterSink.add(value);
  }
  void incrementCounter(){
    _value = _value.copyWith(
      value: _value.value + 1,
      createdAt: DateTime.now(),
    );
    _counterSink.add(value);
  }
  void decrementCounter(){
    _value = _value.copyWith(
      value: _value.value - 1,
      createdAt: DateTime.now(),
    );
    _counterSink.add(value);
  }
  @override
  void dispose() {
    _controller.close();
  }

}
