import 'package:come_back/bloc/event.dart';
import 'package:come_back/bloc/state.dart';
import 'package:come_back/bloc/view_model.dart';
import 'package:come_back/model/model.dart';
import 'package:come_back/repository/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApiViewModel>(
      create: (context) => ApiViewModel(
        RepositoryProvider.of<ProductRepository>(context),
      )..add(LoadingApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
        ),
        body: BlocBuilder<ApiViewModel, ApiState>(
          builder: (context, state) {
            if (state is ApiLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ApiLoadedState) {
              List<Product> products = state.products;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    leading: Image.network(
                      product.thumbnail,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                    title: Text(product.title),
                    subtitle: Text(product.category),
                    trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                  );
                },
              );
            }
            return state is ApiErrorState
                ? Center(
                    child: Text(
                      'An error occurred: ${state.error}',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container(); // Added a return statement for error cases.
          },
        ),
      ),
    );
  }
}
