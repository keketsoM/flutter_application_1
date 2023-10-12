import 'package:flutter_application_1/model/blocs/wishList/wishList_event.dart';
import 'package:flutter_application_1/model/blocs/wishList/wishList_state.dart';
import 'package:flutter_application_1/model/wishList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListBloc extends Bloc<wishListEvent, WishListState> {
  WishListBloc() : super(WishListLoaded());

  @override
  Stream<WishListState> mapEventToState(
    wishListEvent event,
  ) async* {
    if (event is StartWishList) {
      yield* _mapStartWishListToState();
    } else if (event is AddWishListProduct) {
      yield* _mapAddWishListProductToState(event, state);
    } else if (event is RemoveWishListProduct) {
      yield* _mapRemoveWishListProductToState(event, state);
    }
  }

  Stream<WishListState> _mapStartWishListToState() async* {
    yield WishListLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield WishListLoading();
    } catch (_) {}
  }

  Stream<WishListState> _mapAddWishListProductToState(
    AddWishListProduct event,
    WishListState state,
  ) async* {
    yield WishListLoaded();
    if (state is WishListLoaded) {
      try {
        var newWishList = WishList(
            products: List.from(state.wishList.products)..add(event.product));

        yield WishListLoaded(wishList: newWishList);
      } catch (_) {}
    }
  }

  Stream<WishListState> _mapRemoveWishListProductToState(
    RemoveWishListProduct event,
    WishListState state,
  ) async* {
    yield WishListLoaded();
    if (state is WishListLoaded) {
      try {
        yield WishListLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }
}
