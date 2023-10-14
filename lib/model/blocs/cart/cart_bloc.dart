import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter_application_1/model/blocs/cart/cart_event.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_state.dart';
import 'package:flutter_application_1/model/cart.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_onCartStarted);
    on<CartProductAdded>(_onCartProductAdded);
    on<CartProductRemove>(_onCartProductRemove);
  }
  FutureOr<void> _onCartStarted(
      CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(CartLoaded());
    } catch (_) {}
  }

  FutureOr<void> _onCartProductAdded(
      CartProductAdded event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..add(event.product),
            ),
          ),
        );
      } catch (e) {
        emit(CartError());
      }
    }
  }

  FutureOr<void> _onCartProductRemove(
      CartProductRemove event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..remove(event.product),
            ),
          ),
        );
      } catch (e) {
        emit(CartError());
      }
    }
  }
}
