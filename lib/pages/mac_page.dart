import 'package:flutter/material.dart';
import 'package:myapp_update/components/drawer.dart';
import 'package:myapp_update/pages/detail_product.dart';
import '../models/product.dart';

class MacPage extends StatefulWidget {
  const MacPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MacPageState createState() => _MacPageState();
}

class _MacPageState extends State<MacPage> {
  List<Product> produk = [
    Product(
        1, 'MacBook Pro 13', 'Rp 19.499.000', 'assets/images/mac_pro13.jpg'),
    Product(
        2, 'MacBook Pro 14', 'Rp 32.999.000', 'assets/images/mac_pro14.jpg'),
    Product(
        3, 'MacBook Pro M1', 'Rp 16.499.000', 'assets/images/mac_pro_mi.jpg'),
    Product(
        4, 'MacBook Air M1 ', 'Rp 16.899.000', 'assets/images/mac_m1_air.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MacBook',
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
