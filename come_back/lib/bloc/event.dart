

import 'package:come_back/model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ApiEvent extends Equatable {
  const ApiEvent();
}

class LoadingApiEvent extends ApiEvent {
  @override
  List<Product?> get props => throw UnimplementedError();
}
