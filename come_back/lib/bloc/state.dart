

import 'package:come_back/model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ApiState extends Equatable {

} // Abstract class

class ApiLoadingState extends ApiState{
  @override
  List<Object?> get props => [];
}

class ApiLoadedState extends ApiState {
  ApiLoadedState(this.products);
  final List<Product> products;
  @override
  List<Object?> get props => [products];
}

class ApiErrorState extends ApiState {
  final String error;
  ApiErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
