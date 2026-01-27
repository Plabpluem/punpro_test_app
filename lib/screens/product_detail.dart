import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:punpro_test_app/models/product.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:punpro_test_app/providers/products_provider.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({super.key/* , required this.product */});

  // final Product product;

  @override
  ConsumerState<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {

  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productDetailProvider);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (product.images!.isNotEmpty)
                      CarouselSlider(
                        items: product.images?.map((image) {
                          return Image.network(image);
                        }).toList(),
                        options: CarouselOptions(
                          height: 400,
                          viewportFraction: 1,
                          enableInfiniteScroll:
                              product.images!.length > 1,
                          onPageChanged: (index, reason) => setState(() {
                            currentImage = index;
                          }),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: product.images!.asMap().entries.map((
                        entry,
                      ) {
                        return Container(
                          width: 8,
                          height: 8,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentImage == entry.key
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                          ),
                        );
                      }).toList(),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 25,
                      ),
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${product.title}",
                            style: Theme.of(context).textTheme.headlineMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${product.description}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),

                    // Stack(child: Container(child: Text("${product.price}")))
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "\$ ${product.price}",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(8),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12),
                          ),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          overlayColor: Colors.grey,
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.shopping_basket,
                          size: 27,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
