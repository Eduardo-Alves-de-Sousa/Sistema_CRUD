import 'dart:io';
import 'package:crud/exceptions/exceptions_banda.dart';
import 'package:crud/controller/banda_sinfonica_controller.dart';
import 'package:crud/view/concertos_view.dart';
import 'package:crud/view/instrumentos_view.dart';
import 'package:crud/view/membros_view.dart';
import 'package:crud/view/repertorio_view.dart';

void main() {
  // Cria uma instância do controlador da BandaSinfonica
  final bandaController = BandaSinfonicaController();

  // Cria instâncias das visualizações associadas à BandaSinfonicaController
  final membrosView = MembrosView(bandaController);
  final instrumentosView = InstrumentosView(bandaController);
  final repertorioView = RepertorioView(bandaController);
  final concertosView = ConcertosView(bandaController);

  print("|-------------------------------------------|");
  print("|Sistema de Gerenciamento de Banda Sinfônica|");
  print("|-------------------------------------------|");

  while (true) {
    print("\nEscolha uma ação:");
    print("1 - Gerenciar Membros");
    print("2 - Gerenciar Instrumentos");
    print("3 - Gerenciar Repertório");
    print("4 - Gerenciar Concertos");
    print("5 - Sair\n");
    stdout.write("Escolha uma opção: ");

    var escolha = stdin.readLineSync();

    if (escolha == null) {
      // Tratamento de escolha inválida
      print("Escolha inválida, tente novamente.");
      return;
    }

    var escolhaNumero = int.tryParse(escolha);
    if (escolhaNumero == null) {
      // Tratamento de escolha inválida
      print("Escolha inválida, tente novamente.");
      return;
    }

    try {
      switch (escolhaNumero) {
        case 1:
          // Chama o menu de gerenciamento de membros
          membrosView.exibirMenuMembros();
          break;
        case 2:
          // Chama o menu de gerenciamento de instrumentos
          instrumentosView.exibirMenuInstrumentos();
          break;
        case 3:
          // Chama o menu de gerenciamento de repertório
          repertorioView.exibirMenuRepertorio();
          break;
        case 4:
          // Chama o menu de gerenciamento de concertos
          concertosView.exibirMenuConcertos();
          break;
        case 5:
          // Encerra o programa
          print("Saindo...\n");
          return;
        default:
          // Tratamento de escolha inválida
          print("Escolha inválida, tente novamente.\n");
      }
    } catch (e) {
      if (e is CustomException) {
        // Trata exceções personalizadas
        print("Ocorreu uma exceção personalizada: ${e.message}");
      } else {
        // Trata exceções não personalizadas
        print("Ocorreu uma exceção não tratada: $e");
      }
    }
  }
}
