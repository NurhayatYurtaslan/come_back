import 'package:come_back/bloc/event.dart';
import 'package:come_back/bloc/state.dart';
import 'package:come_back/repository/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class ApiViewModel extends Bloc<ApiEvent, ApiState> {
  final ProductRepository _repository;

  ApiViewModel(this._repository) : super(ApiLoadingState()) {
    on<LoadingApiEvent>((event, emit) async {
      emit(ApiLoadingState());

      try {
        final products = await _repository.getProducts();
        emit(ApiLoadedState(products));
      } catch (error) {
        emit(ApiErrorState('$error'));
      }
    });
  }
}
