import 'dart:io';
import 'dart:math';
import 'package:desafio_de_dados/desafio_de_dados.dart';

void main(List<String> arguments) {
  jogarDesafioDados();
}

final Random random = Random();

void jogarDesafioDados() {
  int numeroRodadas;
  bool valido;
  bool validoDadoMagico;
  String resultadoFinal;
  Map<String, int> placarFinal = {'jogador': 0, 'empate': 0, 'cpu': 0};
  bool dadoMagicoJaFoiUsado = false;
  bool dadoMagico = false;
  int valorDadoMagico;
  int resultadoDadoMagico = 0;

  print(
      'Bem-vindo!\nEscolha a quantidade de rodadas que seu jogo vai durar. Caso queira sair, digite 0.');
  numeroRodadas = int.parse(stdin.readLineSync()!);
  valido = numeroRodadas >= 0;
  if (valido) {
    if (numeroRodadas > 0) {
      for (var i = 0; i < numeroRodadas; i++) {
        if (!dadoMagico && !dadoMagicoJaFoiUsado) {
          print(
              "Para usar o dado nessa rodada, digite 1. Caso não queira usar agora, digite 0");
          valorDadoMagico = int.parse(stdin.readLineSync()!);
          validoDadoMagico = valorDadoMagico == 0 || valorDadoMagico == 1;
          if (validoDadoMagico) {
            if (valorDadoMagico == 1) {
              dadoMagico = true;
              dadoMagicoJaFoiUsado = true;
              print("Usando o dado mágico!");
              resultadoDadoMagico = rolarDadoMagico();
              print("O dado deu $resultadoDadoMagico");
            }
          } else {
            print("Valor inválido!");
          }
        }
        List<int> dadosPlayer = [rolarDado(), rolarDado(), rolarDado()];
        List<int> dadosCPU = [rolarDado(), rolarDado(), rolarDado()];
        int somaDadosPlayer = calcularSomaDados(dadosPlayer);
        int somaDadosCPU = calcularSomaDados(dadosCPU);
        if (dadoMagico) {
          print(
              "Essa é a soma dos resultados do dado antes de ser jogado: $somaDadosPlayer");
          if (resultadoDadoMagico == 1) {
            somaDadosPlayer = somaDadosPlayer * 2;
          } else {
            somaDadosPlayer = somaDadosPlayer ~/ 2;
          }
          print(
              "Essa é a soma dos resultados do dado depois de ser jogado: $somaDadosPlayer");
          dadoMagico = false;
        }
        String resultadoRodada = determinarVencedorRodada(
            somaDadosPlayer, somaDadosCPU, placarFinal);
        print(
            "Rodada ${i + 1}:\nDados\tPlayer\tCPU\nDado 1\t${dadosPlayer[0]}\t${dadosCPU[0]}\nDado 2\t${dadosPlayer[1]}\t${dadosCPU[1]}\nDado 3\t${dadosPlayer[2]}\t${dadosCPU[2]}\nSoma:\t$somaDadosPlayer\t$somaDadosCPU");
        print("Esse foi o resultado da rodada: $resultadoRodada");
      }
      print(
          "Placar Final:\nVitórias Jogador: ${placarFinal['jogador']}\nEmpates: ${placarFinal['empate']}\nVitórias CPU: ${placarFinal['cpu']}");
      resultadoFinal = determinarResultadoPartida(placarFinal);
      print("Esse foi o resultado Final: $resultadoFinal");
    } else {
      print("Muito obrigado por jogar!");
    }
  } else {
    print("Valor Inválido");
  }
}
