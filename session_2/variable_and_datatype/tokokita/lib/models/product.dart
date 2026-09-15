const String namaToko = 'TokoKita';
var contohVar = 'Kaos';
final String contohFinal = 'Laptop';
int contohStok = 25;
double contohHarga = 150000;
String contohNama = 'Sepatu';
bool contohTersedia = true;

List<String> daftarKategori = ['Elektronik', 'Fashion', 'Makanan'];

Map<String, dynamic> produkMentah = {
  'id': 'P001',
  'name': 'Laptop',
  'price': 7500000.0,
  'stock': 10,
  'category': 'Elektronik',
};

double hitungTotal(double harga, int qty) => harga * qty;
int hitungSisaStok(int stok, int qty) => stok - qty;
double tambahOngkir(double total, double ongkir) => total + ongkir;
double hargaRata(double total, int qty) => total / qty;
int sisaBagiStok(int stok, int qty) => stok % qty;
bool bandingHarga(double a, double b) => a == b;
bool bedaHarga(double a, double b) => a != b;
bool lebihMahal(double a, double b) => a > b;
bool lebihMurah(double a, double b) => a < b;
bool stokCukup(int stok, int batas) => stok >= batas;
bool stokHabis(int stok) => stok <= 0;
bool layakTampil(int stok, double harga) => stok > 0 && harga > 0;
bool perluPerhatian(int stok, double harga) => stok <= 0 || harga <= 0;
bool tidakTersedia(int stok) => !(stok > 0);

String labelStatusProduk(int stok) {
  if (stok <= 0) return 'Habis';
  if (stok <= 5) return 'Stok Terbatas';
  return 'Tersedia';
}

double totalDariHarga(List<double> daftar) {
  double total = 0;
  for (var h in daftar) {
    total += h;
  }
  return total;
}

int kurangiStok(int stok) {
  while (stok > 0) {
    stok--;
  }
  return stok;
}

double diskonKategori(String kategori) {
  switch (kategori) {
    case 'Elektronik':
      return 10;
    case 'Fashion':
      return 15;
    case 'Makanan':
      return 5;
    default:
      return 0;
  }
}

double hitungHargaSetelahDiskon(double harga, double persenDiskon) {
  return harga - (harga * persenDiskon / 100);
}

double hitungDiskon({required double harga, double persen = 10}) {
  return harga - (harga * persen / 100);
}

String formatRupiah(double harga) => 'Rp${harga.toStringAsFixed(0)}';

class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  int stock;
  final String? description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });
  
  String getStatusStok() {
    if (stock <= 0) return 'Habis';
    if (stock <= 5) return 'Stok Terbatas';
    return 'Tersedia';
  }

  String get info => '$name ($price) - ${getStatusStok()}';
}

class DiscountedProduct extends Product {
  final double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.stock,
    super.description,
    required this.discountPercent,
  });

  double get hargaFinal => hitungHargaSetelahDiskon(price, discountPercent);
}

final List<Product> dummyProducts = [
  Product(
    id: 'P1',
    name: 'Laptop',
    price: 7500000,
    imageUrl: 'https://picsum.photos/seed/laptop/400/400',
    category: 'Elektronik',
    stock: 10,
    description: 'Ringan',
  ),
  Product(
    id: 'P2',
    name: 'HP',
    price: 3200000,
    imageUrl: 'https://picsum.photos/seed/hp/400/400',
    category: 'Elektronik',
    stock: 3,
    description: '5G',
  ),
  Product(
    id: 'P3',
    name: 'Kaos',
    price: 85000,
    imageUrl: 'https://picsum.photos/seed/kaos/400/400',
    category: 'Fashion',
    stock: 25,
    description: 'Katun',
  ),
  Product(
    id: 'P4',
    name: 'Sepatu',
    price: 450000,
    imageUrl: 'https://picsum.photos/seed/sepatu/400/400',
    category: 'Fashion',
    stock: 0,
    description: 'Lari',
  ),
  Product(
    id: 'P5',
    name: 'Roti',
    price: 18000,
    imageUrl: 'https://picsum.photos/seed/roti/400/400',
    category: 'Makanan',
    stock: 50,
    description: 'Cokelat',
  ),
  Product(
    id: 'P6',
    name: 'Kopi',
    price: 35000,
    imageUrl: 'https://picsum.photos/seed/kopi/400/400',
    category: 'Makanan',
    stock: 4,
    description: 'Aren',
  ),
  Product(
    id: 'P7',
    name: 'Headset',
    price: 275000,
    imageUrl: 'https://picsum.photos/seed/headset/400/400',
    category: 'Elektronik',
    stock: 0,
  ),
  Product(
    id: 'P8',
    name: 'Jaket',
    price: 299000,
    imageUrl: 'https://picsum.photos/seed/jaket/400/400',
    category: 'Fashion',
    stock: 12,
  ),
];

double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0;
  for (var p in keranjang) {
    total += p.price;
  }
  return total;
}

void main() {
  print('Toko: $namaToko');
  print('var: $contohVar');
  print('final: $contohFinal');

  print(
    'Produk: $contohNama, Harga: $contohHarga, Stok: $contohStok, Tersedia: $contohTersedia',
  );

  print('Kategori: $daftarKategori');
  print('Produk mentah: $produkMentah');
  print('Total 3 item: ${hitungTotal(contohHarga, 3)}');
  print('Sisa stok: ${hitungSisaStok(contohStok, 3)}');
  print('Total + ongkir: ${tambahOngkir(100000, 15000)}');
  print('Harga rata-rata: ${hargaRata(150000, 3)}');
  print('Sisa bagi stok: ${sisaBagiStok(20, 3)}');
  print('Harga sama: ${bandingHarga(100, 100)}');
  print('Harga beda: ${bedaHarga(100, 200)}');
  print('Lebih mahal: ${lebihMahal(200, 100)}');
  print('Lebih murah: ${lebihMurah(100, 200)}');
  print('Stok cukup: ${stokCukup(5, 5)}');
  print('Stok habis: ${stokHabis(0)}');
  print('Layak tampil: ${layakTampil(contohStok, contohHarga)}');
  print('Perlu perhatian: ${perluPerhatian(0, 0)}');
  print('Tidak tersedia: ${tidakTersedia(0)}');
  print('Status stok 0: ${labelStatusProduk(0)}');
  print('Status stok 3: ${labelStatusProduk(3)}');
  print('Status stok 10: ${labelStatusProduk(10)}');
  print('Total daftar harga: ${totalDariHarga([10000, 25000, 5000])}');
  print('Stok setelah dikurangi: ${kurangiStok(3)}');
  print('Diskon Elektronik: ${diskonKategori('Elektronik')}%');
  print('Harga setelah diskon: ${hitungHargaSetelahDiskon(100000, 10)}');
  print('Diskon default: ${hitungDiskon(harga: 100000)}');
  print('Diskon 20%: ${hitungDiskon(harga: 100000, persen: 20)}');
  print('Format: ${formatRupiah(150000)}');

  for (var p in dummyProducts) {
    print(p.info);
  }

  print('Total belanja: ${hitungTotalBelanja(dummyProducts)}');
}
