import 'package:flutter/material.dart';
import '../services/mahasiswa_service.dart';
import '../models/mahasiswa.dart';
import 'dart:async';

class MahasiswaPage extends StatefulWidget {
  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
  final MahasiswaService service = MahasiswaService();

  List<Mahasiswa> data = [];

  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();

  int? selectedId;
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final result = await service.getAllMahasiswa();

    setState(() {
      data = result;
    });
  }

  Future<void> simpanMahasiswa() async {
    Mahasiswa mahasiswa = Mahasiswa(
      nama: namaController.text,
      nim: nimController.text,
      jurusan: jurusanController.text,
    );

    if (selectedId != null) {
      mahasiswa.id = selectedId;
      await service.updateMahasiswa(mahasiswa);
    } else {
      await service.addMahasiswa(mahasiswa);
    }

    namaController.clear();
    nimController.clear();
    jurusanController.clear();
    selectedId = null;
    isEditMode = false;

    await loadData();
  }

  Future<void> hapusMahasiswa(int id) async {
    await service.deleteMahasiswa(id);
    await loadData();
  }

  void editMahasiswa(Mahasiswa mhs) {
    selectedId = mhs.id;
    namaController.text = mhs.nama;
    nimController.text = mhs.nim;
    jurusanController.text = mhs.jurusan;
    isEditMode = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Mahasiswa")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            TextField(
              controller: nimController,
              decoration: InputDecoration(labelText: "NIM"),
            ),
            TextField(
              controller: jurusanController,
              decoration: InputDecoration(labelText: "Jurusan"),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: simpanMahasiswa, child: Text("Simpan")),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final mhs = data[index];

                  return ListTile(
                    title: Text(mhs.nama),
                    subtitle: Text("${mhs.nim} - ${mhs.jurusan}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => editMahasiswa(mhs),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => hapusMahasiswa(mhs.id!),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
