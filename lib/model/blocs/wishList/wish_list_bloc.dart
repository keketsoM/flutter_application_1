import 'dart:async';

import 'package:flutter_application_1/model/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<wishListEvent, WishListState> {
  WishListBloc() : super(const WishListLoaded()) {
    on<StartWishList>(_onStartWishList);
    on<AddWishListProduct>(_onWishListProduct);
    on<RemoveWishListProduct>(_onRemoveWishListProduct);
  }

  FutureOr<void> _onStartWishList(event, Emitter<WishListState> emit) async {
    emit(WishListLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(WishListLoaded());
    } catch (_) {}
  }

  FutureOr<void> _onWishListProduct(event, Emitter<WishListState> emit) async {
    final state = this.state;
    emit(const WishListLoaded());
    if (state is WishListLoaded) {
      try {
        emit(
          WishListLoaded(
            wishList: WishList(
              products: List.from(state.wishList.products)..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  FutureOr<void> _onRemoveWishListProduct(
      event, Emitter<WishListState> emit) async {
    final state = this.state;
    emit(const WishListLoaded());
    if (state is WishListLoaded) {
      try {
        emit(
          WishListLoaded(
            wishList: WishList(
              products: List.from(state.wishList.products)
                ..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }
}
