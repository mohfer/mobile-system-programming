import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Bricolage Grotesque saya pilih untuk judul karena tebalnya tegas dan
// terasa ramah, cocok untuk nama menu. Figtree dipakai pada teks isi supaya
// harga dan keterangan tetap bersih serta mudah dibaca di layar HP.
class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.size = 14,
    this.weight = FontWeight.w400,
    this.color,
    this.heading = false,
  });

  final String text;
  final double size;
  final FontWeight weight;
  final Color? color;
  final bool heading;

  @override
  Widget build(BuildContext context) {
    final base = heading
        ? GoogleFonts.bricolageGrotesque(fontWeight: FontWeight.w700)
        : GoogleFonts.figtree();
    return Text(
      text,
      style: base.copyWith(fontSize: size, fontWeight: weight, color: color),
    );
  }
}
