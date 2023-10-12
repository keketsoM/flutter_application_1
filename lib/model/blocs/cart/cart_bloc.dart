import 'package:bloc/bloc.dart';

import 'package:flutter_application_1/model/blocs/cart/cart_event.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_state.dart';
import 'package:flutter_application_1/model/cart.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading());

  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartStarted) {
      yield* _mapCartStatedToState();
    } else if (event is CartProductAdded) {
      yield* _mapCartProductAddedToState(event, state);
    } else if (event is CartProductRemove) {
      yield* _mapCartProductRemoveToState(event, state);
    }
  }

  Stream<CartState> _mapCartStatedToState() async* {
    yield CartLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
      yield CartLoaded();
    } catch (_) {}
  }

  Stream<CartState> _mapCartProductAddedToState(
      CartProductAdded event, CartState state) async* {
    yield CartLoaded();
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<CartState> _mapCartProductRemoveToState(
      CartProductRemove event, CartState state) async* {
    yield CartLoaded();
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }
}
