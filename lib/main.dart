import 'package:flutter/material.dart';

void main() {
  runApp(const AppleStore());
}

class Product {
  final String nama;
  final String gambar;
  int jumlahCart;

  Product(this.nama, this.gambar, {this.jumlahCart = 0});
}

class AppleStore extends StatefulWidget {
  const AppleStore({Key? key}) : super(key: key);

  @override
  State<AppleStore> createState() => _AppleStoreState();
}

class _AppleStoreState extends State<AppleStore> {
  List<Product> produk = [
    Product('Iphone 11 Pro Max', 'assets/images/iphone-14.jpg'),
    Product('Iphone 15 Pro Max', 'assets/images/iphone-15.jpg'),
    Product('Iphone 13 Pro Max', 'assets/images/iphone-14.jpg'),
    Product('Iphone 11 Pro Max', 'assets/images/iphone-11.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'iBox Official Store',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.amber,
          ),
          body: Padding(
            padding: const EdgeInsets.only(
                top: 5, left: 65.0, right: 30.0, bottom: 40.0),
            child: ListView.builder(
              itemCount: produk.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              produk[index].gambar,
                              height: 110,
                              width: 110,
                            ),
                            Text(
                              produk[index].nama,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Add to cart: ${produk[index].jumlahCart}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (produk[index].jumlahCart > 0) {
                                        produk[index].jumlahCart--;
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber,
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Color.fromARGB(255, 27, 26, 26),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      produk[index].jumlahCart++;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Color.fromARGB(255, 27, 26, 26),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(width: 50),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
