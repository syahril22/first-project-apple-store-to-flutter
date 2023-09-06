import 'package:flutter/material.dart';
import 'package:myapp_update/components/drawer.dart';
import 'package:myapp_update/pages/iphone_page.dart';
import 'package:myapp_update/pages/mac_page.dart';
import 'package:myapp_update/pages/watch_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List Banner start
  final List<String> banners = [
    'assets/images/banner.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];

  int _currentIndex = 0;
  // List Banner end

  // List Categories start
  final List<CategoryData> categories = [
    CategoryData('iPhone', Icons.phone_iphone),
    CategoryData('Mac', Icons.laptop_mac),
    CategoryData('Watch', Icons.watch),
    // Tambahkan kategori lainnya di sini
  ];
  // List Categories end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),

      // Drawer start
      drawer: const MyDrawer(),
      // Drawer end
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Search your product',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onChanged: (text) {},
            ),
            const SizedBox(
              height: 15,
            ),
            // banner start
            SizedBox(
              height: 160,
              width: double.infinity,
              child: PageView.builder(
                  itemCount: banners.length,
                  controller: PageController(initialPage: _currentIndex),
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      banners[index],
                      fit: BoxFit.cover,
                      height: 160,
                      width: double.infinity,
                    );
                  }),
            ),
            // banner end
            const SizedBox(
              height: 15,
            ),
            // Kategori produk start
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Untuk meletakkan teks di sebelah kiri
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  color: Colors.grey[200], // Warna background untuk kategori
                  padding: const EdgeInsets.all(
                    10,
                  ), // Padding untuk kontainer kategori
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Mengatur 3 kolom
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio:
                          1 / 1, // Mengatur rasio yang lebih kecil
                    ),
                    itemCount: categories.length,
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Agar tidak bisa digulir
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Mengarahkan ke halaman yang sesuai dengan kategori yang diklik
                          if (index == 0) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => IphonePage(),
                            ));
                          } else if (index == 1) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MacPage(),
                            ));
                          } else if (index == 2) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => WatchPage(),
                            ));
                          }
                        },
                        child: CategoryWidget(
                          categoryName: categories[index].name,
                          categoryIcon: categories[index].icon,
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CategoryData {
  final String name;
  final IconData icon;

  CategoryData(this.name, this.icon);
}

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final IconData categoryIcon;

  const CategoryWidget({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Icon(categoryIcon)),
            Expanded(
              child: Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
