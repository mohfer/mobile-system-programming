import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/menu_item.dart';
import '../widgets/app_text.dart';

class TambahMenuPage extends StatefulWidget {
  const TambahMenuPage({super.key});

  @override
  State<TambahMenuPage> createState() => _TambahMenuPageState();
}

class _TambahMenuPageState extends State<TambahMenuPage> {
  final _formKey = GlobalKey<FormState>();
  final _nama = TextEditingController();
  final _harga = TextEditingController();

  @override
  void dispose() {
    _nama.dispose();
    _harga.dispose();
    super.dispose();
  }

  void _simpan() {
    if (!_formKey.currentState!.validate()) return;
    Get.back(result: MenuItem(_nama.text.trim(), int.parse(_harga.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText('Tambah Menu', heading: true, size: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nama,
                decoration: const InputDecoration(labelText: 'Nama menu'),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Nama menu tidak boleh kosong'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _harga,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'Harga',
                  prefixText: 'Rp ',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga tidak boleh kosong';
                  }
                  if (int.tryParse(value) == null || int.parse(value) <= 0) {
                    return 'Harga harus berupa angka lebih dari 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _simpan,
                child: const AppText(
                  'Simpan Menu',
                  size: 15,
                  weight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
