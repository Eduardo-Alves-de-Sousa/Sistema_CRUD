import 'dart:io';
import 'package:crud/exceptions/exceptions_banda.dart';
import 'package:crud/controller/banda_sinfonica_controller.dart';
import 'package:crud/view/concertos_view.dart';
import 'package:crud/view/instrumentos_view.dart';
import 'package:crud/view/membros_view.dart';
import 'package:crud/view/repertorio_view.dart';

void main() {
  final bandaController = BandaSinfonicaController();
  final membrosView = MembrosView(bandaController);
  final instrumentosView = InstrumentosView(bandaController);
  final repertorioView = RepertorioView(bandaController);
  final concertosView = ConcertosView(bandaController);

  print("Sistema de Gerenciamento de Banda Sinfônica");
  print("*-------------------------------------------*");

  while (true) {
    print("\nEscolha uma ação:");
    print("1 - Gerenciar Membros");
    print("2 - Gerenciar Instrumentos");
    print("3 - Gerenciar Repertório");
    print("4 - Gerenciar Concertos");
    print("5 - Sair\n");

    var escolha = stdin.readLineSync();

    if (escolha == null) {
      print("Escolha inválida, tente novamente.");
      return;
    }

    var escolhaNumero = int.tryParse(escolha);
    if (escolhaNumero == null) {
      print("Escolha inválida, tente novamente.");
      return;
    }

    try {
      switch (escolhaNumero) {
        case 1:
          membrosView.exibirMenuMembros();
          break;
        case 2:
          instrumentosView.exibirMenuInstrumentos();
          break;
        case 3:
          repertorioView.exibirMenuRepertorio();
          break;
        case 4:
          concertosView.exibirMenuConcertos();
          break;
        case 5:
          print("Saindo...\n");
          return;
        default:
          print("Escolha inválida, tente novamente.\n");
      }
    } catch (e) {
      if (e is CustomException) {
        print("Ocorreu uma exceção personalizada: ${e.message}");
      } else {
        print("Ocorreu uma exceção não tratada: $e");
      }
    }
  }
}
