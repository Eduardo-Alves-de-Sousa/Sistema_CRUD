import 'dart:io';
import 'package:crud/controller/banda_sinfonica_controller.dart';

class InstrumentosView {
  final BandaSinfonicaController bandaController;

  InstrumentosView(this.bandaController);

  void exibirMenuInstrumentos() {
    while (true) {
      print("\nEscolha uma ação para Instrumentos:");
      print("1 - Adicionar Instrumento");
      print("2 - Listar Instrumentos");
      print("3 - Atualizar Instrumento");
      print("4 - Excluir Instrumento");
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
          print("Nome do instrumento: ");
          var nome = stdin.readLineSync();
          bandaController.adicionarInstrumento(nome!);
          break;
        case 2:
          bandaController.listarInstrumentos();
          break;
        case 3:
          print("Nome do instrumento a ser atualizado: ");
          var nome = stdin.readLineSync();
          print("Novo nome do instrumento: ");
          var novoNome = stdin.readLineSync();
          bandaController.atualizarInstrumento(nome!, novoNome!);
          break;
        case 4:
          print("Nome do instrumento a ser excluído: ");
          var nome = stdin.readLineSync();
          bandaController.excluirInstrumento(nome!);
          break;
        case 5:
          return;
        default:
          print("Escolha inválida, tente novamente.\n");
      }
    }
  }
}
