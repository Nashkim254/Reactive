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
        child: ReactBuilder<CounterModel>(
          stream: react.counterStream,
          initialData: react.value,
          onLoaded: (model) {
            return Text("The counter value is:${react.value.value}");
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: ()=> react.incrementCounter(),
            child: const Center(
              child: Icon(Icons.add),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () => react.decrementCounter(),
            child: const Center(
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
