import 'package:flutter/material.dart';
import 'dart:math';

class TelaDois extends StatefulWidget {
  final String escolhaUsuario;
  const TelaDois({super.key, required this.escolhaUsuario});

  @override
  State<TelaDois> createState() => _TelaDoisState();
}

class _TelaDoisState extends State<TelaDois> {
  late String escolhaApp;
  late String resultado;

  @override
  void initState() {
    super.initState();
    _gerarJogada();
  }

  void _gerarJogada() {
    var opcoes = ["pedra", "papel", "tesoura"];
    escolhaApp = opcoes[Random().nextInt(3)];


    if (widget.escolhaUsuario == escolhaApp) {
      resultado = "Empatou!";
    } else if (
    (widget.escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (widget.escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (widget.escolhaUsuario == "tesoura" && escolhaApp == "papel")
    ) {
      resultado = "Você Ganhou!";
    } else {
      resultado = "Você Perdeu!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Escolha do APP:', style: TextStyle(fontSize: 20)),
            Image.asset('assets/imagem/$escolhaApp.png', width: 120),
            const SizedBox(height: 30),
            const Text('Sua escolha:', style: TextStyle(fontSize: 20)),
            Image.asset('assets/imagem/${widget.escolhaUsuario}.png', width: 120),
            const SizedBox(height: 40),
            Text(resultado, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.red)),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pop(context),
              child: const Text("Jogar novamente", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}