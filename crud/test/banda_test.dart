import 'package:flutter_test/flutter_test.dart';
import 'package:crud/controller/banda_sinfonica_controller.dart';

void main() {
  group('BandaSinfonicaController', () {
    BandaSinfonicaController? controller;

    setUp(() {
      controller = BandaSinfonicaController();
    });

    test('Adicionar e listar membros da banda', () {
      controller?.adicionarMembro('Membro1', 'Papel1');
      controller?.adicionarMembro('Membro2', 'Papel2');

      expect(controller?.membros.length, 2);

      expect(controller?.membros[0].nome, 'Membro1');
      expect(controller?.membros[0].papel, 'Papel1');

      expect(controller?.membros[1].nome, 'Membro2');
      expect(controller?.membros[1].papel, 'Papel2');
    });

    test('Atualizar e excluir membros da banda', () {
      controller?.adicionarMembro('Membro1', 'Papel1');

      controller?.atualizarMembro('Membro1', 'NovoPapel');
      expect(controller?.membros[0].papel, 'NovoPapel');

      controller?.excluirMembro('Membro1');
      expect(controller?.membros.isEmpty, isTrue);
    });

    test('Adicionar e listar instrumentos', () {
      controller?.adicionarInstrumento('Instrumento1');
      controller?.adicionarInstrumento('Instrumento2');

      expect(controller?.instrumentos.length, 2);

      expect(controller?.instrumentos[0].nome, 'Instrumento1');
      expect(controller?.instrumentos[1].nome, 'Instrumento2');
    });

    test('Atualizar e excluir instrumentos', () {
      controller?.adicionarInstrumento('Instrumento1');

      controller?.atualizarInstrumento('Instrumento1', 'NovoInstrumento');
      expect(controller?.instrumentos[0].nome, 'NovoInstrumento');

      controller?.excluirInstrumento('NovoInstrumento');
      expect(controller?.instrumentos.isEmpty, isTrue);
    });

    test('Adicionar e listar repertório', () {
      controller?.adicionarRepertorio('Música1', 'Compositor1');
      controller?.adicionarRepertorio('Música2', 'Compositor2');

      expect(controller?.repertorio.length, 2);

      expect(controller?.repertorio[0].titulo, 'Música1');
      expect(controller?.repertorio[0].compositor, 'Compositor1');

      expect(controller?.repertorio[1].titulo, 'Música2');
      expect(controller?.repertorio[1].compositor, 'Compositor2');
    });

    test('Atualizar e excluir repertório', () {
      controller?.adicionarRepertorio('Música1', 'Compositor1');

      controller?.atualizarRepertorio('Música1', 'NovoCompositor');
      expect(controller?.repertorio[0].compositor, 'NovoCompositor');

      controller?.excluirRepertorio('Música1');
      expect(controller?.repertorio.isEmpty, isTrue);
    });

    test('Adicionar e listar concertos', () {
      controller?.adicionarConcerto('Local1', 'Data1', []);
      controller?.adicionarConcerto('Local2', 'Data2', []);

      expect(controller?.concertos.length, 2);

      expect(controller?.concertos[0].local, 'Local1');
      expect(controller?.concertos[0].data, 'Data1');

      expect(controller?.concertos[1].local, 'Local2');
      expect(controller?.concertos[1].data, 'Data2');
    });

    test('Atualizar e excluir concertos', () {
      controller?.adicionarConcerto('Local1', 'Data1', []);

      controller?.atualizarConcerto('Local1', 'Data1', 'NovoLocal', []);
      expect(controller?.concertos[0].local, 'NovoLocal');

      controller?.excluirConcerto('NovoLocal', 'Data1');
      expect(controller?.concertos.isEmpty, isTrue);
    });

    tearDown(() {
      controller = null;
    });
  });
}
