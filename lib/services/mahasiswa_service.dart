import '../database/mahasiswa_helper.dart';
import '../models/mahasiswa.dart';

class MahasiswaService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<int> addMahasiswa(Mahasiswa mahasiswa) async {
    return await _dbHelper.insertMahasiswa(mahasiswa);
  }

  Future<int> updateMahasiswa(Mahasiswa mahasiswa) async {
    return await _dbHelper.updateMahasiswa(mahasiswa);
  }

  Future<int> deleteMahasiswa(int id) async {
    return await _dbHelper.deleteMahasiswa(id);
  }

  Future<List<Mahasiswa>> getAllMahasiswa() async {
    return await _dbHelper.getAllMahasiswa();
  }
}
