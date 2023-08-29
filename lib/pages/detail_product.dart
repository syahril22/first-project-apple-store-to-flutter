import 'package:flutter/material.dart';
import '../models/product.dart';

class DetailProduct extends StatefulWidget {
  final Product product;

  const DetailProduct({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  late final Product product;

  // variabel cart
  int cartQuantity = 0;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Product',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                product.gambar,
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                product.nama,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.price,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Quantity : $cartQuantity',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          cartQuantity++;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, right: 50, left: 50),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.add_shopping_cart),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
