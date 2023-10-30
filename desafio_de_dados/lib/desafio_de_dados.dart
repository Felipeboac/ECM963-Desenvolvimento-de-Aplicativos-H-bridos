import 'dart:math';

int rolarDado() {
  final random = Random();
  return random.nextInt(6) + 1;
}

int rolarDadoMagico() {
  final random = Random();
  return random.nextInt(2);
}

int calcularSomaDados(List<int> dados) {
  int soma = 0;
  for (int dado in dados) {
    soma += dado;
  }
  return soma;
}

String determinarVencedorRodada(
    int pontosJogador, int pontosCPU, Map placarFinal) {
  if (pontosJogador > pontosCPU) {
    placarFinal['jogador'] += 1;
    return "Vitória do jogador!\n";
  } else if (pontosJogador < pontosCPU) {
    placarFinal['cpu'] += 1;
    return "Vitória da CPU!\n";
  } else {
    placarFinal['empate'] += 1;
    return "Empate!\n";
  }
}

String determinarResultadoPartida(Map placarFinal) {
  if (placarFinal['jogador'] > placarFinal['cpu']) {
    return "O jogador venceu! Parabéns!";
  } else if (placarFinal['cpu'] > placarFinal['jogador']) {
    return "A CPU venceu! Melhor sorte na próxima!";
  } else {
    return "A partida terminou em empate!";
  }
}
