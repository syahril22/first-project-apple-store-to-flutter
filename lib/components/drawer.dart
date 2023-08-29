import 'package:flutter/material.dart';
import 'package:myapp_update/pages/home_page.dart';
import 'package:myapp_update/pages/iphone_tab.dart';
import 'package:myapp_update/pages/mac_tab.dart';
import 'package:myapp_update/pages/watch_tab.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            // lengt full to container
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
          // Home Page start
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
          // iphone page start
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const IphonePage()));
            },
            leading: const Icon(
              Icons.phone_iphone,
              size: 30,
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
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MacPage()));
            },
            leading: const Icon(
              Icons.laptop_mac,
              size: 30,
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
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const WatchPage()));
            },
            leading: const Icon(
              Icons.watch,
              size: 30,
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
        ],
      ),
    );
    // Drawer end
  }
}
