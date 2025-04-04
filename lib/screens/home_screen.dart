import 'package:apiprovider/provider/product_provider.dart';
import 'package:apiprovider/screens/description_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Icon(Icons.coffee, color: Colors.white),
            SizedBox(width: 20),
          ],
          title: Text(
            'Coffee',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(child: Text('Hot Coffee', style: TextStyle(fontSize: 20))),
              Tab(child: Text('Cold Coffee', style: TextStyle(fontSize: 20))),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: productProvider.fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: productProvider.products.length,
                  itemBuilder: (context, index) {
                    final product = productProvider.products[index];
                    return Card(
                      color: Colors.brown[100],
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      DescriptionScreen(product: product),
                            ),
                          );
                        },

                        title: Center(
                          child: Text(
                            product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            FutureBuilder(
              future: productProvider.fetchHotProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: productProvider.products.length,
                  itemBuilder: (context, index) {
                    final product = productProvider.products[index];
                    return Card(
                      color: Colors.brown[100],
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      DescriptionScreen(product: product),
                            ),
                          );
                        },

                        title: Center(
                          child: Text(
                            product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
