import 'package:reactive/observables/observable_base.dart';

void main(List<String> arguments) {
  final obs = Observable<int>(0);
  final obs2 = Observable("yes");
  final oW = runOnceAndRunForEveryChange(() {
    print(obs.value);
    print(obs2.value);
  });
  print("updating while runOnceAndRunForEveryChange is active");
  obs.value = 1;
  obs2.value = "no";
  oW.stopListening();
  print("updating while runOnceAndRunForEveryChange is inactive");
  obs.value = 3;
  print("program exited");
}