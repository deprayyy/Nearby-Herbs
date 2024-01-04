import 'package:flutter/material.dart';
import '../components/card/product_card.dart';
import '../models/shop_models.dart';
import 'maps_page.dart'; // Ganti dengan halaman "Shop Distribution" yang sesuai

class FavoritePage extends StatefulWidget {
  final List<FavoriteTokoObat> favoriteShops;

  const FavoritePage({Key? key, required this.favoriteShops}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorite Shops'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: widget.favoriteShops.isEmpty
                  ? const Center(
                child: Text(
                  'Belum Ada Toko Favorit',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
                  : Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2.7,
                  ),
                  itemCount: widget.favoriteShops.length,
                  itemBuilder: (context, index) {
                    final tokoObat = widget.favoriteShops[index].shop;
                    return ProductCard(
                      shop: tokoObat,
                      isFavorite: true,
                      onTap: () {
                        // Aksi ketika ProductCard di-tap, alihkan ke halaman "Shop Distribution" dengan lokasi yang sesuai
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  MyLocation(
                              // Kirim data lokasi toko yang sesuai ke halaman "Shop Distribution"
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
