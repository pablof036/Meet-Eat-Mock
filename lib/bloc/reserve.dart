import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mae/model/menu_item.dart';
import 'package:mae/model/reserve.dart';

class ReserveCubit extends Cubit<Reserve> {
  ReserveCubit(Reserve initialState) : super(initialState);

  void addItem(MenuItem item) {
    final reserve = Reserve(
      [
        ...state.items,
        item,
      ],
    );
    emit(reserve);
  }

  void removeItem(MenuItem item) {
    final reserve = Reserve(
      state.items
          .where(
            (listItem) => listItem != item,
          )
          .toList(),
    );
    emit(reserve);
  }

  void clear() {
    emit(const Reserve([]));
  }
}
