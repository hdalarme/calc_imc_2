import 'package:calc_imc_2/model/imc.dart';

class IMCRepository {
  final List<IMC> _IMCs = [];

  Future<void> adicinar(IMC imc) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _IMCs.add(imc);
  }

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _IMCs.remove(_IMCs.where((imc) => imc.id == id).first);
  }

  Future<List<IMC>> listar() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _IMCs;
  }
}