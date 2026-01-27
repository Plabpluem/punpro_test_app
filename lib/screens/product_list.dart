import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:punpro_test_app/models/product.dart';
import 'package:punpro_test_app/providers/products_provider.dart';
import 'package:punpro_test_app/screens/product_detail.dart';
import 'package:punpro_test_app/service/product_service.dart';

class ProductListScreen extends ConsumerStatefulWidget {
  const ProductListScreen({super.key});

  @override
  ConsumerState<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  late Future<List<Product>> productFuture;

  Future<List<Product>> _fetchProduct() async {
    return await ProductService().getProducts();
  }

  @override
  void initState() {
    super.initState();
    productFuture = _fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    void onGoDetail(BuildContext context, Product product) {
      ref.read(productDetailProvider.notifier).saveDatil(product);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => ProductDetailScreen(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "All Product",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: FutureBuilder(
        future: productFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.system_security_update_warning_outlined,
                    color: Theme.of(context).colorScheme.primary,
                    size: 100,
                  ),
                  Text(
                    "Something went wrong",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      "Unable to connect to application. Please check your internet",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        productFuture = _fetchProduct();
                      });
                    },
                    child: Text("Refresh"),
                  ),
                ],
              ),
            );
          }

          List<Product> product = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.only(
              top: 4,
              left: 10,
              right: 10,
              bottom: 25,
            ),
            itemCount: product.length,
            itemBuilder: (ctx, int index) {
              return ListTile(
                leading: Image.network(product[index].thumbnail!),
                splashColor: Colors.deepOrange.shade300,
                title: Text(product[index].title!),
                subtitle: Text("\$ ${product[index].price.toString()}"),
                onTap: () => onGoDetail(ctx, product[index]),
              );
            },
          );
        },
      ),
    );
  }
}
