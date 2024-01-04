class TokoObat {
  final String nama;
  final String alamat;
  final double latitude;
  final double longitude;
  double jarak;

  TokoObat({
    required this.nama,
    required this.alamat,
    required this.latitude,
    required this.longitude,
    this.jarak = 0.0,
  });

  get idToko => null;
}

// Contoh data toko obat
List<TokoObat> daftarTokoObat = [
  TokoObat(
    nama: "HNI DC Pakansari Ibu Eti",
    alamat: "KP. Cikempong Rt.02/011 No. 64, Pakansari, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16915",
    latitude: -6.495891302399266,
    longitude: 106.84373498377639,
  ),
  TokoObat(
    nama: "DC Distributor Center HNI HPAI Perum Puri Nirwana 1",
    alamat: "Jl. Cikaret Raya Kp. Pos No.6, RW.16, Pabuaran, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16916",
    latitude: -6.473679460857028,
    longitude: 106.84490827606233,
  ),
  TokoObat(
    nama: "HNI Obat Herbal Neneng",
    alamat: "Jl. Curug, Pakansari, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16915",
    latitude: -6.486043006684208,
    longitude: 106.83742314204487,
  ),
  TokoObat(
    nama: "BC Sentul HNI Bogor",
    alamat: "Jl. Raya Sirkuit Sentul, Leuwinutug, Kec. Citeureup, Kabupaten Bogor, Jawa Barat 16810",
    latitude: -6.512148010824073,
    longitude: 106.86416807085526,
  ),
  TokoObat(
    nama: "SC HNI HPAI KANDANG RODA",
    alamat: "Jl. Kp. Padurenan No.27, RT.1/RW.4, Nanggewer, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16912",
    latitude: -6.518327040444724,
    longitude: 106.83514770061493,
  ),
  TokoObat(
    nama: "Stokis HNI Permata Bintang",
    alamat: "Nanggewer, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16912",
    latitude: -6.509610131476764,
    longitude: 106.8275829365778,
  ),
  TokoObat(
    nama: "Auranjani_shop / DC Halal Mart HNI",
    alamat: "Regency, Erfina Kencana, Jl. Basketball No.45, Nanggewer Mekar, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16912",
    latitude: -6.500971790686657,
    longitude: 106.82661391093893,
  ),
  TokoObat(
    nama: "HALALMART ISTI STOKIS HNI HPAI CIBINONG 01586738",
    alamat: "Jl. Puri Nirwana I No.47, RT.14/RW.14, Pabuaran, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16916",
    latitude: -6.474862691276302,
    longitude: 106.84447289178155,
  ),
  TokoObat(
    nama: "HNI HPAI Stock Center Dewi (Halal Mart)",
    alamat: "Jl. Puri Nirwana I No.08, RT.:02, RW:14, Pabuaran, Cibinong, Bogor Regency, West Java 16916",
    latitude: -6.471135662211549,
    longitude: 106.84518488697236,
  ),
  TokoObat(
    nama: "Stokist Halal Mart HNI HPAI Permata Palem Cibinong",
    alamat: "Perumahan Taman Permata Palem Blok G No 66, Cirimekar, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16917",
    latitude: -6.473243033332954,
    longitude: 106.8500240973054,
  ),
  TokoObat(
    nama: "Distributor HNI HPAI Cibinong Sampora",
    alamat: "GR2X+HQH, Cibinong, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16912",
    latitude: -6.498575447029153,
    longitude: 106.84950566712483,
  ),
  TokoObat(
    nama: "Halal Mart HNI Nanggewer",
    alamat: "Blok, Rawa, Nanggewer, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16912",
    latitude: -6.509435624333846,
    longitude: 106.83559809230402,
  ),
  TokoObat(
    nama: "DC Distributor Center HNI HPAI Puri Nirwana 1 Titik",
    alamat: "Jl. Puri Nirwana I No.B 27, Pabuaran, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16916",
    latitude: -6.473783785916882,
    longitude: 106.84454515115283,
  ),
  TokoObat(
    nama: "DC HNI HPAI INDRIANA PERUMAHAN BOGOR GADING RESIDENCE",
    alamat: "Jl. Raya Sukahati, Sukahati, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16913",
    latitude: -6.487042744508807,
    longitude: 106.8168429606736,
  ),
  TokoObat(
    nama: "STOCKIST / DC HNI HPAI Cibinong Santi mariani",
    alamat: "Perum Depok Alam Lestari Blk. B1 No.8, Harapan Jaya, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16914",
    latitude: -6.45707947938714,
    longitude: 106.8348652531388,
  ),
  TokoObat(
    nama: "DC HNI HPAI SUMARNI",
    alamat: "Puri Nirwana 2 Jl. Mengkudu V No.Rt 004/010, Pabuaran, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16916",
    latitude: -6.45602859929655,
    longitude: 106.84350030543092,
  ),
  TokoObat(
    nama: "DC HNI Dina Halal Mart HPAI",
    alamat: "Jl. Pekapuran No.4A, RT.05/RW.02, Pabuaran, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16916",
    latitude: -6.446665140674088,
    longitude: 106.84822678265712
  ),
  TokoObat(
    nama: "DC Halal Mart HNI Tri Erni S",
    alamat: "Jl. Pekapuran Jalan Semangka No.25, Pabuaran Mekar, Kec. Cibinong, Kabupaten Bogor, Jawa Barat 16916",
    latitude: -6.441807961614756,
    longitude: 106.84677663238523,
  ),
  TokoObat(
    nama: "HNI DC Nuryati Cilodong",
    alamat: "Jln.Asrama Darma putra Cilodong,Gg.Jembar Rt.04/06 No : 30, Kota Depok, Jawa Barat 16474",
    latitude: -6.436473486429483,
    longitude: 106.84506767547397,
  ),
  TokoObat(
    nama: "DC KARANGGAN HNI HPAI / TOKO HAIKAL",
    alamat: "Jl. Kranggan Tua No.rt 04/06, Karanggan, Kec. Gn. Putri, Kabupaten Bogor, Jawa Barat 16960",
    latitude: -6.462243197149144,
    longitude: 106.8779027183625,
  ),
  TokoObat(
    nama: "DC stokis HNI - WIDI HERBAL Cilodong",
    alamat: "Vila Pertiwi, Jl. Anggrek No.20, Sukamaju, Kec. Cilodong, Kota Depok, Jawa Barat 16415",
    latitude: -6.419712049735506,
    longitude: 106.85042777084425,
  ),
  TokoObat(
    nama: "DC HNI FAUZAN",
    alamat: "Jl. Pd. Bambu Kuning No.A8/9, Bojonggede, Kecamatan Bojonggede, Kabupaten Bogor, Jawa Barat 16922",
    latitude: -6.482934837672688,
    longitude: 106.80162008918633,
  ),
];

class FavoriteTokoObat {
  final TokoObat shop;
  bool isFavorite;

  FavoriteTokoObat({
    required this.shop,
    this.isFavorite = false,
  });
}
