import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'amount_provider.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build({required String id}) {
    return 1;
  }

  void increaseByOneAmount() {
    state++;
  }

  void decreaseByOneAmount() {
    state--;

    if (state == 0) {
      state = 1;
    }
  }
}

@Riverpod(keepAlive: true)
class TotalAmount extends _$TotalAmount {
  @override
  int build({required String id, required int price}) {
    return price;
  }

  void increaseByOneAmount() {
    state = state + price;
  }

  void decreaseByOneAmount() {
    state = state - price;
    if (state == 0) {
      state = price;
    }
  }
}


