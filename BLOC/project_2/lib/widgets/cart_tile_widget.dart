// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:project_2/blocs/cart/bloc/cart_bloc.dart';

import 'package:project_2/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({
    Key? key,
    required this.productDataModel,
    required this.cartBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Colors.amber,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.red,
            height: 200,
            width: double.maxFinite,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(productDataModel.category),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${productDataModel.price}'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(HomeProductWishlistButtonClickedEvent(
                      //     clickedproducts: productDataModel));
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(CartRemoveFromCartEvent(
                          productDataModel: productDataModel));
                    },
                    icon: const Icon(Icons.shopping_bag),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
