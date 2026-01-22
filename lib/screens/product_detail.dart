import 'package:flutter/material.dart';
import 'package:punpro_test_app/models/product.dart';

import 'package:carousel_slider/carousel_slider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.product.images!.isNotEmpty)
                CarouselSlider(
                  items: widget.product.images?.map((image) {
                    return Image.network(image);
                  }).toList(),
                  options: CarouselOptions(
                    height: 400,
                    viewportFraction: 1,
                    enableInfiniteScroll: widget.product.images!.length > 1,
                    onPageChanged: (index, reason) => setState(() {
                      currentImage = index;
                    }),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.product.images!.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentImage == entry.key
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  );
                }).toList(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.product.title}",
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${widget.product.description}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),

              // const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
