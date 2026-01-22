import 'package:flutter/material.dart';
import 'package:punpro_test_app/models/product.dart';
import 'package:punpro_test_app/screens/product_detail.dart';
import 'package:punpro_test_app/service/product_service.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> product = [
    Product(
      id: 1,
      title: "name12",
      description: "description",
      images: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqvFdpefJi2hOnOjNhVL78frJ-clk2_NqW8Q&s",
      ],
      thumbnail:
          "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp",
      price: 200,
    ),
  ];

  Future<void> _fetchProduct() async {
    try {
      final data = await ProductService().getProducts();
      setState(() {
        product = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    void onGoDetail(BuildContext context, Product product) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => ProductDetailScreen(product: product),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("All Product")),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        itemCount: product.length,
        itemBuilder: (ctx, int index) {
          return ListTile(
            leading: Image.network(product[index].thumbnail!),
            title: Text(product[index].title!),
            subtitle: Text("${product[index].price.toString()} ฿"),
            onTap: () => onGoDetail(ctx, product[index]),
          );
        },
      ),
    );
  }
}
