import 'package:crud/model/concerto.dart';
import 'package:crud/model/repertorio.dart';

class ConcertoController {
  List<Concerto> concertos = [];
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
