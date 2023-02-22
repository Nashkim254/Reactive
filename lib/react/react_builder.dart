import 'package:flutter/material.dart';
///Abstraction of the StreamBuilder widget
class ReactBuilder<T> extends StatelessWidget {
  const ReactBuilder({
    super.key,
    required this.stream,
    this.onLoading,
    required this.onLoaded,
    this.onError,
    this.initialData,
  });
  final Stream<T?> stream;
  final Widget Function()? onLoading;
  final Widget Function(T instance) onLoaded;
  final Widget Function(String error)? onError;
  final dynamic initialData;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      initialData: initialData,
        builder: (context, AsyncSnapshot<T> snapshot) {
     if (snapshot.hasError) {
        /// return error widget if specified else show default
        return Center(
            child: onError?.call(snapshot.error.toString()) ??
                Text(snapshot.error.toString()));
      } else if(snapshot.connectionState == ConnectionState.waiting){
        /// return loader widget if specified else show default
        return onLoading?.call() ??
            const Center(
              child: CircularProgressIndicator(),
            );
      }
       return onLoaded(snapshot.data as T);
    });
  }
}
