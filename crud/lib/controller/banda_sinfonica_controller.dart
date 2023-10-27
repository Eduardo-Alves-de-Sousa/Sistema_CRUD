//import 'package:crud/model/concerto.dart';
//import 'package:crud/model/instrumento.dart';
import 'package:crud/model/membro_banda.dart';
//import 'package:crud/model/repertorio.dart';

class BandaSinfonicaController {
  List<MembroBanda> membros = [];
  //List<Instrumento> instrumentos = [];
  //List<Repertorio> repertorio = [];
  // List<Concerto> concertos = [];

  // Métodos para gerenciar membros da banda
  void adicionarMembro(String nome, String papel) {
    membros.add(MembroBanda(nome, papel));
  }

  void atualizarMembro(String nome, String novoPapel) {
    var membro = membros.firstWhere((m) => m.nome == nome,
        orElse: () => MembroBanda(nome, ""));
    membro.papel = novoPapel;
  }

  void excluirMembro(String nome) {
    membros.removeWhere((m) => m.nome == nome);
  }

  void listarMembros() {
    for (var membro in membros) {
      print("Nome: ${membro.nome}, Papel: ${membro.papel}");
    }
  }
}
