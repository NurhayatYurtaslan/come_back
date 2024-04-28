// ignore_for_file: library_private_types_in_public_api

import 'package:come_back/bloc/event.dart';
import 'package:come_back/bloc/state.dart';
import 'package:come_back/bloc/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiViewModel()..add(ApiInitialEvent(context)),
      child: BlocBuilder<ApiViewModel, ApiState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Product List'),
            ),
            body: Column(
              children: [
                (state.products.isEmpty) ?
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                : 
                  ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
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
                  ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}