import 'dart:async';

import 'package:flutter_application_1/model/blocs/wishList/wishList_event.dart';
import 'package:flutter_application_1/model/blocs/wishList/wishList_state.dart';
import 'package:flutter_application_1/model/wishList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListBloc extends Bloc<wishListEvent, WishListState> {
  WishListBloc() : super(WishListLoaded()) {
    on<StartWishList>(_onStartWishList);
    on<AddWishListProduct>(_onWishListProduct);
    on<RemoveWishListProduct>(_onRemoveWishListProduct);
  }

  FutureOr<void> _onStartWishList(event, Emitter<WishListState> emit) async {
    final state = this.state;
    emit(WishListLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(WishListLoading());
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


//   Stream<WishListState> _mapAddWishListProductToState(
//     AddWishListProduct event,
//     WishListState state,
//   ) async* {
//     yield WishListLoaded();
//     if (state is WishListLoaded) {
//       try {
//         var newWishList = WishList(
//             products: List.from(state.wishList.products)..add(event.product));

//         yield WishListLoaded(wishList: newWishList);
//       } catch (_) {}
//     }
//   }

//   Stream<WishListState> _mapRemoveWishListProductToState(
//     RemoveWishListProduct event,
//     WishListState state,
//   ) async* {
//     yield WishListLoaded();
//     if (state is WishListLoaded) {
//       try {
//         yield WishListLoaded(
//             wishList: WishList(
//                 products: List.from(state.wishList.products)
//                   ..remove(event.product)));
//       } catch (_) {}
//     }
//   }
// }
