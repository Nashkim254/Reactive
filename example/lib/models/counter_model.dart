class CounterModel {
  final int value;
  final DateTime createdAt;

  CounterModel({
    required this.value,
    required this.createdAt});

  CounterModel copyWith({
int? value,
DateTime? createdAt,
  }) {
    return CounterModel(
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
