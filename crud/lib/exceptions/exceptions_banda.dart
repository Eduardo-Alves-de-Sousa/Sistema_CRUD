class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() => message;
}

// Exceção personalizada para representar um membro não encontrado
class MembroNaoEncontrado extends CustomException {
  MembroNaoEncontrado(String message) : super(message);
}

// Exceção personalizada para representar um instrumento não encontrado
class InstrumentoNaoEncontrado extends CustomException {
  InstrumentoNaoEncontrado(String message) : super(message);
}

// Exceção personalizada para representar um repertório não encontrado
class RepertorioNaoEncontrado extends CustomException {
  RepertorioNaoEncontrado(String message) : super(message);
}

// Exceção personalizada para representar um concerto não encontrado
class ConcertoNaoEncontrado extends CustomException {
  ConcertoNaoEncontrado(String message) : super(message);
}
