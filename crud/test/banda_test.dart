import 'package:crud/model/repertorio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crud/controller/banda_sinfonica_controller.dart';

void main() {
  group('Teste de Membro da Bamba', () {
    // ignore: unused_local_variable
    BandaSinfonicaController? controller;

    setUp(() {
      controller = BandaSinfonicaController();
    });
    test('Adicionar membro da banda', () {
      BandaSinfonicaController controller = BandaSinfonicaController();

      controller.adicionarMembro('Membro1', 'Papel1');

      expect(controller.membros.length, 1);
      expect(controller.membros[0].nome, 'Membro1');
      expect(controller.membros[0].papel, 'Papel1');
    });

    test('Listar membros da banda', () {
      BandaSinfonicaController controller = BandaSinfonicaController();
      controller.adicionarMembro('Membro1', 'Papel1');
      controller.adicionarMembro('Membro2', 'Papel2');

      expect(controller.membros.length, 2);
    });

    test('Atualizar membro da banda', () {
      BandaSinfonicaController controller = BandaSinfonicaController();
      controller.adicionarMembro('Membro1', 'Papel1');

      controller.atualizarMembro('Membro1', 'NovoPapel');
      expect(controller.membros[0].papel, 'NovoPapel');
    });

    test('Excluir membro da banda', () {
      BandaSinfonicaController controller = BandaSinfonicaController();
      controller.adicionarMembro('Membro1', 'Papel1');

      controller.excluirMembro('Membro1');
      expect(controller.membros.isEmpty, isTrue);
    });
  });
  group('Teste de Instrumento', () {
    // ignore: unused_local_variable
    BandaSinfonicaController? controller;

    setUp(() {
      controller = BandaSinfonicaController();
    });
    test('Adicionar instrumento', () {
      BandaSinfonicaController controller = BandaSinfonicaController();

      controller.adicionarInstrumento('Instrumento1');
      controller.adicionarInstrumento('Instrumento2');

      expect(controller.instrumentos.length, 2);

      expect(controller.instrumentos[0].nome, 'Instrumento1');
      expect(controller.instrumentos[1].nome, 'Instrumento2');
    });

    test('Listar instrumentos', () {
      BandaSinfonicaController controller = BandaSinfonicaController();
      controller.adicionarInstrumento('Instrumento1');
      controller.adicionarInstrumento('Instrumento2');

      expect(controller.instrumentos.length, 2);
    });

    test('Atualizar instrumento', () {
      BandaSinfonicaController controller = BandaSinfonicaController();
      controller.adicionarInstrumento('Instrumento1');

      controller.atualizarInstrumento('Instrumento1', 'NovoInstrumento');
      expect(controller.instrumentos[0].nome, 'NovoInstrumento');
    });

    test('Excluir instrumento', () {
      BandaSinfonicaController controller = BandaSinfonicaController();
      controller.adicionarInstrumento('Instrumento1');

      controller.excluirInstrumento('Instrumento1');
      expect(controller.instrumentos.isEmpty, isTrue);
    });
  });
  group('Teste de Repertório', () {
    // ignore: unused_local_variable
    BandaSinfonicaController? controller;

    setUp(() {
      controller = BandaSinfonicaController();
    });
    test('Adicionar música ao repertório', () {
      BandaSinfonicaController controller = BandaSinfonicaController();

      controller.adicionarRepertorio('Música1', 'Compositor1');
      controller.adicionarRepertorio('Música2', 'Compositor2');

      expect(controller.repertorio.length, 2);

      expect(controller.repertorio[0].titulo, 'Música1');
      expect(controller.repertorio[0].compositor, 'Compositor1');

      expect(controller.repertorio[1].titulo, 'Música2');
      expect(controller.repertorio[1].compositor, 'Compositor2');
    });

    test('Listar repertório', () {
      BandaSinfonicaController controller = BandaSinfonicaController();
      controller.adicionarRepertorio('Música1', 'Compositor1');
      controller.adicionarRepertorio('Música2', 'Compositor2');

      expect(controller.repertorio.length, 2);

      // Teste a saída do repertório aqui, por exemplo, usando `expect` com `print`.
    });

    test('Atualizar música no repertório', () {
      BandaSinfonicaController controller = BandaSinfonicaController();
      controller.adicionarRepertorio('Música1', 'Compositor1');

      controller.atualizarRepertorio('Música1', 'NovoCompositor');
      expect(controller.repertorio[0].compositor, 'NovoCompositor');
    });

    test('Excluir música do repertório', () {
      BandaSinfonicaController controller = BandaSinfonicaController();
      controller.adicionarRepertorio('Música1', 'Compositor1');

      controller.excluirRepertorio('Música1');
      expect(controller.repertorio.isEmpty, isTrue);
    });
    group('Teste de Concerto', () {
      // ignore: unused_local_variable
      BandaSinfonicaController? controller;

      setUp(() {
        controller = BandaSinfonicaController();
      });
      test('Adicionar concerto', () {
        BandaSinfonicaController controller = BandaSinfonicaController();

        // Crie um repertório de exemplo
        List<Repertorio> repertorio = [
          Repertorio('Música1', 'Compositor1'),
          Repertorio('Música2', 'Compositor2'),
        ];

        controller.adicionarConcerto('Local1', 'Data1', repertorio);
        controller.adicionarConcerto('Local2', 'Data2', repertorio);

        expect(controller.concertos.length, 2);

        expect(controller.concertos[0].local, 'Local1');
        expect(controller.concertos[0].data, 'Data1');

        expect(controller.concertos[1].local, 'Local2');
        expect(controller.concertos[1].data, 'Data2');
      });

      test('Listar concertos', () {
        BandaSinfonicaController controller = BandaSinfonicaController();

        // Adicione concertos de exemplo
        List<Repertorio> repertorio = [
          Repertorio('Música1', 'Compositor1'),
          Repertorio('Música2', 'Compositor2'),
        ];
        controller.adicionarConcerto('Local1', 'Data1', repertorio);
        controller.adicionarConcerto('Local2', 'Data2', repertorio);

        expect(controller.concertos.length, 2);

        // Teste a saída da listagem de concertos aqui, por exemplo, usando `expect` com `print`.
      });

      test('Atualizar concerto', () {
        BandaSinfonicaController controller = BandaSinfonicaController();

        // Adicione um concerto de exemplo
        List<Repertorio> repertorio = [
          Repertorio('Música1', 'Compositor1'),
          Repertorio('Música2', 'Compositor2'),
        ];
        controller.adicionarConcerto('Local1', 'Data1', repertorio);

        // Atualize o concerto
        List<Repertorio> novoRepertorio = [
          Repertorio('Música3', 'Compositor3'),
          Repertorio('Música4', 'Compositor4'),
        ];
        controller.atualizarConcerto(
            'Local1', 'Data1', 'NovoLocal', novoRepertorio);
        expect(controller.concertos[0].local, 'NovoLocal');
        expect(controller.concertos[0].repertorio, novoRepertorio);
      });

      test('Excluir concerto', () {
        BandaSinfonicaController controller = BandaSinfonicaController();

        // Adicione um concerto de exemplo
        List<Repertorio> repertorio = [
          Repertorio('Música1', 'Compositor1'),
          Repertorio('Música2', 'Compositor2'),
        ];
        controller.adicionarConcerto('Local1', 'Data1', repertorio);

        controller.excluirConcerto('Local1', 'Data1');
        expect(controller.concertos.isEmpty, isTrue);
      });
    });
  });
}
