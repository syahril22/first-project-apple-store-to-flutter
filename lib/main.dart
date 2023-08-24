import 'package:flutter/material.dart';

void main() {
  runApp(const AppleStore());
}

class Product {
  final String nama;
  final String price;
  final String gambar;
  int jumlahCart;

  Product(this.nama, this.price, this.gambar, {this.jumlahCart = 0});
}

class AppleStore extends StatefulWidget {
  const AppleStore({Key? key}) : super(key: key);

  @override
  State<AppleStore> createState() => _AppleStoreState();
}

class _AppleStoreState extends State<AppleStore> {
  // List myTab
  final List<Tab> myTab = [
    const Tab(
      text: 'iPhone',
      icon: Icon(Icons.phone_iphone),
    ),
    const Tab(
      text: 'Mac',
      icon: Icon(Icons.laptop_mac),
    ),
    const Tab(
      text: 'Watch',
      icon: Icon(Icons.watch),
    ),
  ];

  List<Product> produk = [
    Product('iPhone 11 Pro Max', 'Rp 8.899.000', 'assets/images/iphone-14.jpg'),
    Product('iPhone 15 Pro Max', 'Rp 8.899.000', 'assets/images/iphone-15.jpg'),
    Product('iPhone 13 Pro Max', 'Rp 8.899.000', 'assets/images/iphone-14.jpg'),
    Product('iPhone 11 Pro Max', 'Rp 8.899.000', 'assets/images/iphone-11.jpg'),
    Product('iPhone 11 Pro Max', 'Rp 8.899.000', 'assets/images/iphone-14.jpg'),
    Product('iPhone 15 Pro Max', 'Rp 8.899.000', 'assets/images/iphone-15.jpg'),
    Product('iPhone 13 Pro Max', 'Rp 8.899.000', 'assets/images/iphone-14.jpg'),
    Product('iPhone 11 Pro Max', 'Rp 8.899.000', 'assets/images/iphone-11.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: myTab.length,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'iBox Official Store',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
              // Tab-Bar
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(90.0),
                child: TabBar(
                    // style label tab
                    labelColor: Colors.white,
                    // style indikator
                    indicator: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ))),
                    tabs: myTab),
              ),
            ),
            body: TabBarView(children: [
              // first page to App start
              GridView.builder(
                  padding: const EdgeInsets.all(25),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //jumlah kolom
                    mainAxisSpacing: 15.0, //jarak vertikal
                    crossAxisSpacing: 15.0, // jarak horizontal
                    childAspectRatio: 0.7, // rasio items
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
                          Text(
                            produk[index].nama,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            produk[index].price,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Add to cart: ${produk[index].jumlahCart}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          // button cart start
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                  backgroundColor: Colors.grey,
                                  padding: const EdgeInsets.all(2.0),
                                ),
                                child: const Icon(
                                  Icons.remove_shopping_cart,
                                  color: Colors.black,
                                  size: 20,
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
                                  backgroundColor: Colors.grey,
                                  padding: const EdgeInsets.all(2.0),
                                ),
                                child: const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          // button cart end
                        ],
                      ),
                    );
                  }),
              // first page to App end
              const Center(
                  child: Text(
                'Mac Book Page',
                style: TextStyle(
                  fontSize: 40,
                ),
              )),
              const Center(
                  child: Text(
                'Watch Page',
                style: TextStyle(
                  fontSize: 40,
                ),
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
