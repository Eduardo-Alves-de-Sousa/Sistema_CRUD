import 'dart:io';
import 'package:crud/controller/repertorio_controller.dart';

class RepertorioView {
  final RepertorioController repertorioController;

  RepertorioView(this.repertorioController);

  void exibirMenuRepertorio() {
    while (true) {
      // Menu de ações relacionadas ao Repertório
      print("\nEscolha uma ação para Repertório:");
      print("1 - Adicionar Música ao Repertório");
      print("2 - Listar Repertório");
      print("3 - Atualizar Música no Repertório");
      print("4 - Excluir Música do Repertório");
      print("5 - Voltar ao menu principal\n");

      var escolha = stdin.readLineSync();

      if (escolha == null) {
        // Tratamento de escolha inválida
        print("Escolha inválida, tente novamente.");
        continue;
      }

      var escolhaNumero = int.tryParse(escolha);
      if (escolhaNumero == null) {
        // Tratamento de escolha inválida
        print("Escolha inválida, tente novamente.");
        continue;
      }

      switch (escolhaNumero) {
        case 1:
          // Adicionar uma música ao Repertório
          print("Título da música: ");
          var titulo = stdin.readLineSync();
          print("Compositor: ");
          var compositor = stdin.readLineSync();
          repertorioController.adicionarRepertorio(titulo!, compositor!);
          break;
        case 2:
          // Listar o Repertório
          repertorioController.listarRepertorio();
          break;
        case 3:
          // Atualizar uma música no Repertório
          print("Título da música a ser atualizada: ");
          var titulo = stdin.readLineSync();
          print("Novo compositor: ");
          var novoCompositor = stdin.readLineSync();
          repertorioController.atualizarRepertorio(titulo!, novoCompositor!);
          break;
        case 4:
          // Excluir uma música do Repertório
          print("Título da música a ser excluída: ");
          var titulo = stdin.readLineSync();
          repertorioController.excluirRepertorio(titulo!);
          break;
        case 5:
          // Retornar ao menu principal
          return;
        default:
          // Tratamento de escolha inválida
          print("Escolha inválida, tente novamente.\n");
      }
    }
  }
}
