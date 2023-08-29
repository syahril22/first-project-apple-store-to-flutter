import 'package:flutter/material.dart';
import 'package:myapp_update/components/drawer.dart';
import 'package:myapp_update/pages/detail_product.dart';
import '../models/product.dart';

class IphonePage extends StatefulWidget {
  const IphonePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IphonePageState createState() => _IphonePageState();
}

class _IphonePageState extends State<IphonePage> {
  List<Product> produk = [
    Product('iPhone 11 Pro Max', 'Rp 8.899.000', 'assets/images/11.jpg'),
    Product('iPhone 12 Pro Max', 'Rp 9.899.000', 'assets/images/12.jpg'),
    Product('iPhone 13 Pro Max', 'Rp 14.999.000', 'assets/images/13.jpg'),
    Product('iPhone 14 Pro Max', 'Rp 16.899.000', 'assets/images/14.jpg'),
    Product('iPhone 11 Pro Max', 'Rp 8.899.000', 'assets/images/11.jpg'),
    Product('iPhone 12 Pro Max', 'Rp 9.899.000', 'assets/images/12.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'iPhone',
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
      drawer: MyDrawer(),
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
