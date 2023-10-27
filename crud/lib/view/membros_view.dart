import 'dart:io';
import 'package:crud/controller/banda_sinfonica_controller.dart';

class MembrosView {
  final BandaSinfonicaController bandaController;

  MembrosView(this.bandaController);

  void exibirMenuMembros() {
    while (true) {
      print("\nEscolha uma ação para Membros:");
      print("1 - Adicionar Membro");
      print("2 - Listar Membros");
      print("3 - Atualizar Membro");
      print("4 - Excluir Membro");
      print("5 - Voltar ao menu principal\n");
      stdout.write("Escolha uma opção: ");
      var escolha = stdin.readLineSync();
      // Tratamento de escolha inválida
      if (escolha == null) {
        print("Escolha inválida, tente novamente.");
        continue;
      }
      // Tratamento de escolha inválida
      var escolhaNumero = int.tryParse(escolha);
      if (escolhaNumero == null) {
        print("Escolha inválida, tente novamente.");
        continue;
      }

      switch (escolhaNumero) {
        case 1:
          print("Nome do membro: ");
          var nome = stdin.readLineSync();
          print("Papel do membro: ");
          var papel = stdin.readLineSync();
          bandaController.adicionarMembro(nome!, papel!);
          break;
        case 2:
          bandaController.listarMembros();
          break;
        case 3:
          print("Nome do membro a ser atualizado: ");
          var nome = stdin.readLineSync();
          print("Novo papel: ");
          var novoPapel = stdin.readLineSync();
          bandaController.atualizarMembro(nome!, novoPapel!);
          break;
        case 4:
          print("Nome do membro a ser excluído: ");
          var nome = stdin.readLineSync();
          bandaController.excluirMembro(nome!);
          break;
        case 5:
          return;
        default:
          print("Escolha inválida, tente novamente.\n");
      }
    }
  }
}
