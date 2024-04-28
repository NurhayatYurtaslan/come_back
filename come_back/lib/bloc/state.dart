import 'package:come_back/model.dart';

abstract class ApiState {
  List<Product> products;
  ApiState({this.products = const <Product>[],
  });
     
} // Soyut sınıf

class ApiInitialState extends ApiState {
  ApiInitialState();
}

//emit dediğimizde kullanılacak state //it ite buyurur it de kutruğuna

class ApiDataProductState extends ApiState {
  ApiDataProductState(List<Product> products)
      : super(products: products);
}

