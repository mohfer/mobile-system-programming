class MenuItem {
  const MenuItem(this.nama, this.harga);

  final String nama;
  final int harga;
}

String formatRupiah(int harga) =>
    'Rp ${harga.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.')}';
