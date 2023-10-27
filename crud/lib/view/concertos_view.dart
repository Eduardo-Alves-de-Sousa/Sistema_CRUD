import 'dart:io';
import 'package:crud/controller/banda_sinfonica_controller.dart';
import 'package:crud/model/repertorio.dart';

class ConcertosView {
  final BandaSinfonicaController bandaController;

  ConcertosView(this.bandaController);

  void exibirMenuConcertos() {
    while (true) {
      print("\nEscolha uma ação para Concertos:");
      print("1 - Adicionar Concerto");
      print("2 - Listar Concertos");
      print("3 - Atualizar Concerto");
      print("4 - Excluir Concerto");
      print("5 - Voltar ao menu principal\n");

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
          print("Local do concerto: ");
          var local = stdin.readLineSync();
          print("Data do concerto: ");
          var data = stdin.readLineSync();
          var repertorio = <Repertorio>[];
          print("Adicionar músicas ao repertório (Digite 's' para sair):");
          while (true) {
            print("Título da música: ");
            var titulo = stdin.readLineSync();
            if (titulo == 's') break;
            print("Compositor: ");
            var compositor = stdin.readLineSync();
            repertorio.add(Repertorio(titulo!, compositor!));
          }
          bandaController.adicionarConcerto(local!, data!, repertorio);
          break;
        case 2:
          bandaController.listarConcertos();
          break;
        case 3:
          print("Local do concerto a ser atualizado: ");
          var local = stdin.readLineSync();
          print("Data do concerto a ser atualizado: ");
          var data = stdin.readLineSync();
          print("Novo local do concerto: ");
          var novoLocal = stdin.readLineSync();
          var novoRepertorio = <Repertorio>[];
          print(
              "Adicionar músicas atualizadas ao repertório (Digite 's' para sair):");
          while (true) {
            print("Título da música: ");
            var titulo = stdin.readLineSync();
            if (titulo == 's') break;
            print("Compositor: ");
            var compositor = stdin.readLineSync();
            novoRepertorio.add(Repertorio(titulo!, compositor!));
          }
          bandaController.atualizarConcerto(
              local!, data!, novoLocal!, novoRepertorio);
          break;
        case 4:
          print("Local do concerto a ser excluído: ");
          var local = stdin.readLineSync();
          print("Data do concerto a ser excluído: ");
          var data = stdin.readLineSync();
          bandaController.excluirConcerto(local!, data!);
          break;
        case 5:
          return;
        default:
          print("Escolha inválida, tente novamente.\n");
      }
    }
  }
}
