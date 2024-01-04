import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/shop_models.dart';
import 'favorite_page.dart';
import 'dart:math' show atan2, cos, pi, sin, sqrt;
import 'package:url_launcher/url_launcher.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int _selectedShopIndex = -1;
  List<FavoriteTokoObat> _favoriteShops = []; // List untuk menyimpan daftar toko favorit
  double userLatitude = 0;
  double userLongitude = 0;
  bool _isCalculatingDistance = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        userLatitude = position.latitude;
        userLongitude = position.longitude;
      });

      _refreshData();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      _isCalculatingDistance = true;
    });

    for (var tokoObat in daftarTokoObat) {
      final distance = _hitungJarakHaversine(
        userLatitude,
        userLongitude,
        tokoObat.latitude,
        tokoObat.longitude,
      );
      tokoObat.jarak = distance;
    }

    daftarTokoObat.sort((a, b) => a.jarak.compareTo(b.jarak));

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isCalculatingDistance = false;
    });

    _showNearestShopNotification(); // Show snackbar notification.
  }

  void _showNearestShopNotification() {
    if (daftarTokoObat.isNotEmpty) {
      final nearestShop = daftarTokoObat.first;
      final snackbar = SnackBar(
        backgroundColor: Colors.green,
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_sharp,
              color: Colors.white,
            ),
            const SizedBox(width: 8), // Add some spacing between icon and text
            Flexible(
              child: Text(
                'Hasil : ${nearestShop.nama} (${nearestShop.jarak.toStringAsFixed(2)} km)',
                style: const TextStyle(fontSize: 15),
                overflow: TextOverflow.ellipsis, // Handle long text
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: RefreshIndicator(
          color: Colors.black,
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Set to spaceBetween
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Temukan Toko Herbal HNI Terdekat Anda",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Klik untuk rincian lebih lanjut dan rute',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.add_business,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

                if (_isCalculatingDistance)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text("Menghitung jarak..."),
                    ),
                  ),
                if (!_isCalculatingDistance)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: daftarTokoObat.length,
                    itemBuilder: (context, index) {
                      final tokoObat = daftarTokoObat[index];
                      final jarak = tokoObat.jarak;
                      Color jarakColor = _getJarakColor(jarak);
                      bool isSelected = _selectedShopIndex == index;
                      int favoriteIndex =
                      _favoriteShops.indexWhere((element) => element.shop == tokoObat);
                      bool isFavorite = favoriteIndex != -1;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        child: Card(
                          elevation: 5,
                          color: isSelected ? Colors.white54 : Colors.grey[200],
                          child: ExpansionTile(
                            leading: const Icon(
                              Icons.location_on,
                              color: Colors.redAccent,
                            ),
                            title: Text(
                              tokoObat.nama,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  const TextSpan(
                                    text: 'Jarak: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${tokoObat.jarak.toStringAsFixed(2)} km',
                                    style: TextStyle(
                                      color: jarakColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (isFavorite) {
                                    _favoriteShops.removeAt(favoriteIndex);
                                  } else {
                                    _favoriteShops.add(FavoriteTokoObat(shop: tokoObat));
                                  }
                                });
                              },
                            ),
                            children: [
                              ListTile(
                                title: Text(tokoObat.alamat),
                                subtitle: Text(
                                    'Latitude: ${tokoObat.latitude}, Longitude: ${tokoObat.longitude}'),
                                onTap: () {
                                  setState(() {
                                    _selectedShopIndex = isSelected ? -1 : index;
                                  });
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _bukaPetaDenganRute(
                                        userLatitude,
                                        userLongitude,
                                        tokoObat.latitude,
                                        tokoObat.longitude,
                                      );
                                    },
                                    icon: const Icon(Icons.directions),
                                    label: const Text('Rute'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      onPrimary: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritePage(favoriteShops: _favoriteShops),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.favorite),
      ),
    );
  }

  double _hitungJarakHaversine(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371.0;

    final double dLat = _toRadians(lat2 - lat1);
    final double dLon = _toRadians(lon2 - lon1);

    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) * cos(_toRadians(lat2)) * sin(dLon / 2) * sin(dLon / 2);

    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degree) {
    return degree * (pi / 180);
  }

  Color _getJarakColor(double jarak) {
    const double maxJarak = 12.0;
    const double minJarak = 0.0;

    const Color redColor = Colors.greenAccent;
    const Color greenColor = Colors.red;

    double relativeJarak = (jarak - minJarak) / (maxJarak - minJarak);

    int redValue = (255 * relativeJarak).round();
    int greenValue = (255 - (255 * relativeJarak)).round();

    return Color.fromRGBO(redValue, greenValue, 0, 1.0);
  }

  void _bukaPetaDenganRute(
      double startLatitude, double startLongitude, double endLatitude, double endLongitude) async {
    final String url =
        "https://www.google.com/maps/dir/?api=1&origin=$startLatitude,$startLongitude&destination=$endLatitude,$endLongitude";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Tidak dapat membuka aplikasi peta.");
    }
  }
}
