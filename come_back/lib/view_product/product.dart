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
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 220, 165, 165),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 110, 75, 175),
            fontSize: 25,
          ),
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
                    title: Text(
                      product.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      product.category,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    trailing: Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: product.price < 100
                            ? Colors.green
                            : (product.price >= 100 && product.price <= 500)
                                ? Colors.orange
                                : Colors.red,
                      ),
                    ),
                  );
                },
              );
            }
            return state is ApiErrorState
                ? Center(
                    child: Text(
                      'An error occurred: ${state.error}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : Container(); // Added a return statement for error cases.
          },
        ),
      ),
    );
  }
}
