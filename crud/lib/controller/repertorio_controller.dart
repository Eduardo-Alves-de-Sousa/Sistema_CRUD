import 'package:crud/model/repertorio.dart';

class RepertorioController {
  List<Repertorio> repertorio = [];

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
}
