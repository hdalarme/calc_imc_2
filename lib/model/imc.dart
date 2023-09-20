import 'package:flutter/cupertino.dart';

class IMC {
  final String _id = UniqueKey().toString();
  String nome;
  String peso;
  String altura;

  IMC(this.nome, this.peso, this.altura);

  String get id => _id;

  String calcImc(IMC imc) {
    
    double pesoc = double.parse(imc.peso);
    double alturac = double.parse(imc.altura);

    double imcc = pesoc / (alturac * alturac);

    String imcClasificacao;

    if (imcc < 16) {
      imcClasificacao = 'Magreza grave';
    } else if (imcc >= 16 && imcc < 17 ) {
      imcClasificacao = 'Magreza moderada';
    } else if (imcc >= 17 && imcc < 18.5 ) {
      imcClasificacao = 'Magreza leve';
    } else if (imcc >= 18.5 && imcc < 25 ) {
      imcClasificacao = 'Saudável';
    } else if (imcc >= 25 && imcc < 30 ) {
      imcClasificacao = 'Sobrepeso';
    } else if (imcc >= 30 && imcc < 35 ) {
      imcClasificacao = 'Obesidade Grau I';
    } else if (imcc >= 35 && imcc < 40 ) {
      imcClasificacao = 'Obesidade Grau II';
    } else if (imcc >= 40) {
      imcClasificacao = 'Obesidade Grau III';
    } else {
      imcClasificacao = 'Impossivel calcular IMC';
    }

    return " : IMC: " + imcc.toStringAsFixed(1) + " , Classificação: " + imcClasificacao;
  }
}
