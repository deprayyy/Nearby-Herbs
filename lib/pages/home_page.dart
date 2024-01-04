import 'package:flutter/material.dart';
import 'package:nearbyherbs/pages/maps_page.dart';
import '../components/bottom_navbar.dart';
import 'shop_page.dart';
import 'help.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const MyLocation(),
  ];

  // Daftar judul aplikasi sesuai dengan halaman yang sesuai
  final List<String> _appBarTitles = [
    'Daftar Toko', // Halaman 0 (ShopPage)
    'Explore', // Halaman 1 (MyLocation)
    'Favorites', // Halaman 2 (FavoritePage)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 5),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Icon(Icons.menu_sharp, color: Colors.black, size: 28),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          centerTitle: true,
          title: Text(
            _appBarTitles[_selectedIndex],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20, // Atur ukuran judul halaman sesuai keinginan Anda
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Logo
                DrawerHeader(
                  child: Image.asset(
                    'assets/logo.png',
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),
                // Other pages
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: const Text(
                      'Beranda',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Ketika menu "Home" diklik, arahkan ke halaman Home (HomePage)
                      Navigator.pop(context); // Tutup drawer
                      navigateBottomBar(0); // Tampilkan halaman Home
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: const Icon(Icons.help, color: Colors.white),
                    title: const Text(
                      'Bantuan',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Ketika menu "Help" diklik, arahkan ke halaman Help (HelpPage)
                      Navigator.pop(context); // Tutup drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HelpPage()), // Tambahkan perutean ke halaman HelpPage
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: const Icon(Icons.info, color: Colors.white),
                    title: const Text(
                      'Tentang',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Ketika menu "About" diklik, arahkan ke halaman About (AboutPage)
                      Navigator.pop(context); // Tutup drawer
                      Navigator.pushNamed(context, '/About');
                    },
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                title: Text(
                  'Created by 50419121',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
