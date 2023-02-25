import 'package:example/models/counter_model.dart';
import 'package:example/reacts/counter_react.dart';
import 'package:flutter/material.dart';
import 'package:reactive/react/react.dart';
import 'package:reactive/react/react_builder.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterBase react = React.of<CounterBase>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
      ),
      body: Center(
        child: ReactBuilder<int>(
            stream: react.counterStream,
            initialData: react.value,
            onLoaded: (snapshot){
              return Text('Button pressed this many times: $snapshot');
            }
        )
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: ()=> react.eventSink.add(CounterAction.Increment),
            child: const Center(
              child: Icon(Icons.add),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () => react.eventSink.add(CounterAction.Decrement),
            child: const Center(
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
