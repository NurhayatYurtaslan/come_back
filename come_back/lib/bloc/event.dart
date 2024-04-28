import 'package:flutter/material.dart';

abstract class ApiEvent {}

class ApiInitialEvent extends ApiEvent {
  BuildContext context;
  ApiInitialEvent(this.context);
}