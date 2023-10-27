import 'package:crud/model/concerto.dart';
import 'package:crud/model/instrumento.dart';
import 'package:crud/model/membro_banda.dart';
import 'package:crud/model/repertorio.dart';

class BandaSinfonicaController {
  List<MembroBanda> membros = [];
  List<Instrumento> instrumentos = [];
  List<Repertorio> repertorio = [];
  List<Concerto> concertos = [];

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
      // ignore: avoid_print
      print("Nome: ${membro.nome}, Papel: ${membro.papel}");
    }
  }

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
      // ignore: avoid_print
      print("Instrumento: ${instrumento.nome}");
    }
  }

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
      // ignore: avoid_print
      print("Título: ${musica.titulo}, Compositor: ${musica.compositor}");
    }
  }

  void adicionarConcerto(
      String local, String data, List<Repertorio> repertorio) {
    // Verificar se já existe um concerto com o mesmo local e data
    var concertoExistenteIndex =
        concertos.indexWhere((c) => c.local == local && c.data == data);

    if (concertoExistenteIndex != -1) {
      // Se já existe um concerto com o mesmo local e data, atualizamos seu repertório
      concertos[concertoExistenteIndex].repertorio = repertorio;
    } else {
      // Caso contrário, adicionamos um novo concerto
      concertos.add(Concerto(local, data, repertorio));
    }
  }

  void atualizarConcerto(String local, String data, String novoLocal,
      List<Repertorio> novoRepertorio) {
    var concerto = concertos.firstWhere(
        (c) => c.local == local && c.data == data,
        orElse: () => Concerto(local, data, []));
    concerto.local = novoLocal;
    concerto.repertorio = novoRepertorio;
  }

  void excluirConcerto(String local, String data) {
    concertos.removeWhere((c) => c.local == local && c.data == data);
  }

  void listarConcertos() {
    for (var concerto in concertos) {
      // ignore: avoid_print
      print("Local: ${concerto.local}, Data: ${concerto.data}");
      // ignore: avoid_print
      print("Repertório:");
      for (var musica in concerto.repertorio) {
        // ignore: avoid_print
        print(" - Título: ${musica.titulo}, Compositor: ${musica.compositor}");
      }
    }
  }
}
