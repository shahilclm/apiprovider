import 'package:apiprovider/models/item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DescriptionScreen extends StatelessWidget {
  final Item product;

  const DescriptionScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //    // excludeHeaderSemantics:,
      //    toolbarOpacity: .1,
      //    backgroundColor: Colors.teal,

      //    //excludeHeaderSemantics: true,
      //    toolbarHeight: -20,
      //    bottomOpacity: 0.3,
      //    forceMaterialTransparency: true,
      // ,
      //  ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              fit: BoxFit.cover,
              progressIndicatorBuilder:
                  (context, url, progress) => CircularProgressIndicator(
                    padding: EdgeInsets.all(40),
                    color: Colors.brown,
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.brown,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Chip(
                    backgroundColor: Colors.brown[900],
                    label: Text(
                      '\$ ${product.price}',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      product.description,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    color: Colors.brown.shade900,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ingredients',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              ...product.ingredients.map(
                                (ingredient) => Text(
                                  ingredient,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
