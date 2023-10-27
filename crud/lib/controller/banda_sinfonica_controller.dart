import 'package:crud/model/concerto.dart';
import 'package:crud/model/instrumento.dart';
import 'package:crud/model/membro_banda.dart';
import 'package:crud/model/repertorio.dart';

class BandaSinfonicaController {
  List<MembroBanda> membros = [];
  List<Instrumento> instrumentos = [];
  List<Repertorio> repertorio = [];
  List<Concerto> concertos = [];

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

  // Métodos para gerenciar repertório
  void adicionarRepertorio(String titulo, String compositor) {
    repertorio.add(Repertorio(titulo, compositor));
  }

  void atualizarRepertorio(String titulo, String novoCompositor) {
    var musica = repertorio.firstWhere((r) => r.titulo == titulo,
        orElse: () => Repertorio(titulo, ""));
    musica.compositor = novoCompositor;
  }

  void excluirRepertorio(String titulo) {
    repertorio.removeWhere((r) => r.titulo == titulo);
  }

  void listarRepertorio() {
    for (var musica in repertorio) {
      print("Título: ${musica.titulo}, Compositor: ${musica.compositor}");
    }
  }

  // Métodos para gerenciar concertos
  void adicionarConcerto(
      String local, String data, List<Repertorio> repertorio) {
    concertos.add(Concerto(local, data, repertorio));
  }

  void atualizarConcerto(String local, String data, String novoLocal,
      List<Repertorio> novoRepertorio) {
    final concertoIndex =
        concertos.indexWhere((c) => c.local == local && c.data == data);

    if (concertoIndex != -1) {
      concertos[concertoIndex].local = novoLocal;
      concertos[concertoIndex].repertorio = novoRepertorio;
    }
  }

  void excluirConcerto(String local, String data) {
    concertos.removeWhere((c) => c.local == local && c.data == data);
  }

  void listarConcertos() {
    for (var concerto in concertos) {
      print("Local: ${concerto.local}, Data: ${concerto.data}");
      print("Repertório:");
      for (var musica in concerto.repertorio) {
        print(" - Título: ${musica.titulo}, Compositor: ${musica.compositor}");
      }
    }
  }
}
