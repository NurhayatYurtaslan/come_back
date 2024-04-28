import 'package:come_back/bloc/event.dart';
import 'package:come_back/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ApiViewModel extends Bloc<ApiEvent, ApiState> {
  ApiViewModel() : super(ApiInitialState()) {
    on<ApiInitialEvent>((event, emit) {
      
    });
  }
} 