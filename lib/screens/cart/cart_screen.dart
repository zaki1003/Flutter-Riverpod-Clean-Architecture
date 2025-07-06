import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:flutter_riverpod_clean_architecture/providers/cart_provider.dart';
import 'package:flutter_riverpod_clean_architecture/providers/products_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart'), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: [
                ...cartProducts.map((product) {
                  return Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),

                    child: Row(
                      children: [
                        Image.asset(product.image, width: 60, height: 60),
                        const SizedBox(width: 10),
                        Text('${product.title}...'),
                        const Expanded(child: SizedBox()),
                        Text('£${product.price}'),
                      ],
                    ),
                  );
                }),
              ], // output cart products here
            ),

            // output totals here
          ],
        ),
      ),
    );
  }
}
