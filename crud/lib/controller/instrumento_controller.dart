import 'package:crud/model/instrumento.dart';

class InstrumentoController {
  List<Instrumento> instrumentos = [];

  // Métodos para gerenciar instrumentos
  void adicionarInstrumento(String nome) {
    instrumentos.add(Instrumento(nome));
  }

  void atualizarInstrumento(String nome, String novoNome) {
    var instrumento = instrumentos.firstWhere((i) => i.nome == nome,
        orElse: () => Instrumento(nome));
    instrumento.nome = novoNome;
  }

  void excluirInstrumento(String nome) {
    instrumentos.removeWhere((i) => i.nome == nome);
  }

  void listarInstrumentos() {
    for (var instrumento in instrumentos) {
      print("Instrumento: ${instrumento.nome}");
    }
  }
}
