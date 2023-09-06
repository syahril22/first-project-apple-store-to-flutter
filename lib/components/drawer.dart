import 'package:flutter/material.dart';
import 'package:myapp_update/pages/home_page.dart';
import 'package:myapp_update/pages/iphone_page.dart';
import 'package:myapp_update/pages/mac_page.dart';
import 'package:myapp_update/pages/watch_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 80,
            color: Colors.black,
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Menu Pilihan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            leading: const Icon(
              Icons.home,
              size: 34,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          // Home Page end
          // Product menu start
          ExpansionTile(
              tilePadding: const EdgeInsets.only(left: 20, right: 10),
              iconColor: Colors.black,
              leading: const Icon(
                Icons.local_mall,
                size: 25,
                color: Colors.black,
              ),
              title: const Text(
                'Product',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              children: [
                // iphone page start
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 20),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const IphonePage()));
                  },
                  leading: const Icon(
                    Icons.phone_iphone,
                    size: 25,
                  ),
                  title: const Text(
                    'iPhone',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                // iphone page end
                // mac page start
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 20),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MacPage()));
                  },
                  leading: const Icon(
                    Icons.laptop_mac,
                    size: 25,
                  ),
                  title: const Text(
                    'MacBook',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                // mac page end
                // watch page start
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 20),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const WatchPage()));
                  },
                  leading: const Icon(
                    Icons.watch,
                    size: 25,
                  ),
                  title: const Text(
                    'Watch ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                // watch page end
              ]),
          // product menu end
        ],
      ),
    );
    // Drawer end
  }
}
