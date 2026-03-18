import 'package:flutter/material.dart';
import 'teladois.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tela1(),
    );
  }
}

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

  void _jogar(BuildContext context, String escolha) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaDois(escolhaUsuario: escolha)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedra, Papel, Tesoura', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Image.asset('assets/imagem/padrao.png', width: 140, height: 140),
          const SizedBox(height: 10),
          const Text('Escolha uma opção:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _jogar(context, "pedra"),
                child: Image.asset('assets/imagem/pedra.png', width: 90),
              ),
              GestureDetector(
                onTap: () => _jogar(context, "papel"),
                child: Image.asset('assets/imagem/papel.png', width: 90),
              ),
              GestureDetector(
                onTap: () => _jogar(context, "tesoura"),
                child: Image.asset('assets/imagem/tesoura.png', width: 90),
              ),
            ],
          )
        ],
      ),
    );
  }
}