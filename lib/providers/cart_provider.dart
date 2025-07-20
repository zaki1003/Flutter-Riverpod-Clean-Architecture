import 'package:flutter_riverpod_clean_architecture/models/product.dart'
    show Product;
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Notifier Providers
// use when you need to update the state & notify consumers

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return const {};
  }

  // methods to update state

  // methods to update state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}
