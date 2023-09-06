import 'package:flutter/material.dart';
import 'package:myapp_update/components/drawer.dart';
import 'package:myapp_update/pages/detail_product.dart';
import '../models/product.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WatchPageState createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  List<Product> produk = [
    Product(
        1, 'Apple Watch Series 6', 'Rp 3.499.000', 'assets/images/watch5.jpg'),
    Product(
        2, 'Apple Watch Series 8', 'Rp 5.999.000', 'assets/images/watch2.jpg'),
    Product(3, 'Apple Watch SE', 'Rp 3.499.000', 'assets/images/watch3.jpg'),
    Product(
        4, 'Apple Watch Series 7', 'Rp 5.499.000', 'assets/images/watch4.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Apple Watch',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      // Drawer start
      drawer: const MyDrawer(),
      // Drawer end
      body: GridView.builder(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //jumlah kolom
            mainAxisSpacing: 15.0, //jarak vertikal
            crossAxisSpacing: 15.0, // jarak horizontal
            childAspectRatio: 1 / 1.6, // rasio items
          ),
          itemCount: produk.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    produk[index].gambar,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    produk[index].nama,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    produk[index].price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailProduct(
                                  product: produk[
                                      index]); // Mengirimkan produk[index] sebagai argumen
                            },
                          ),
                        );
                      },
                      child: const Text('Detail Product')),
                ],
              ),
            );
          }),
    );
  }
}
