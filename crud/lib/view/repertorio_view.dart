import 'dart:io';
import 'package:crud/controller/banda_sinfonica_controller.dart';

class RepertorioView {
  final BandaSinfonicaController bandaController;

  RepertorioView(this.bandaController);

  void exibirMenuRepertorio() {
    while (true) {
      print("\nEscolha uma ação para Repertório:");
      print("1 - Adicionar Música ao Repertório");
      print("2 - Listar Repertório");
      print("3 - Atualizar Música no Repertório");
      print("4 - Excluir Música do Repertório");
      print("5 - Voltar ao menu principal");

      var escolha = stdin.readLineSync();

      if (escolha == null) {
        print("Escolha inválida, tente novamente.");
        continue;
      }

      var escolhaNumero = int.tryParse(escolha);
      if (escolhaNumero == null) {
        print("Escolha inválida, tente novamente.");
        continue;
      }

      switch (escolhaNumero) {
        case 1:
          print("Título da música: ");
          var titulo = stdin.readLineSync();
          print("Compositor: ");
          var compositor = stdin.readLineSync();
          bandaController.adicionarRepertorio(titulo!, compositor!);
          break;
        case 2:
          bandaController.listarRepertorio();
          break;
        case 3:
          print("Título da música a ser atualizada: ");
          var titulo = stdin.readLineSync();
          print("Novo compositor: ");
          var novoCompositor = stdin.readLineSync();
          bandaController.atualizarRepertorio(titulo!, novoCompositor!);
          break;
        case 4:
          print("Título da música a ser excluída: ");
          var titulo = stdin.readLineSync();
          bandaController.excluirRepertorio(titulo!);
          break;
        case 5:
          return;
        default:
          print("Escolha inválida, tente novamente.\n");
      }
    }
  }
}
