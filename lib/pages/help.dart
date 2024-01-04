import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader('Cara Penggunaan Aplikasi'),
            const SizedBox(height: 10),
            _buildStep('Anda dapat mengklik toko pada daftar untuk melihat alamat dan informasi lebih lanjut.'),
            _buildStep('Daftar toko akan ditampilkan berdasarkan jarak terdekat dari lokasi Anda.'),
            _buildStep('Pilih menu "Daftar Toko" untuk melihat daftar toko obat herbal HNI terdekat dari lokasi Anda.'),
            const SizedBox(height: 20),
            _buildAdditionalInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String headerText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        headerText,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildStep(String stepText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[900],
              child: Text(
                (stepText.indexOf('.') != -1) ? stepText[0] : stepText[0] + '.',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              stepText,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informasi Tambahan:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildAdditionalItem('Kunjungi menu "Explore" untuk melihat peta lokasi toko obat herbal HNI.'),
            _buildAdditionalItem('Tambahkan toko ke "Favorites" untuk menyimpan toko favorit Anda.'),
            const SizedBox(height: 10),
            _buildAdditionalItem('Pastikan GPS Anda aktif untuk mendapatkan lokasi toko yang akurat.'),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalItem(String itemText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              itemText,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
