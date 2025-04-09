import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/// ListView-Projekt mit ListViewBuilder
/// von:
/// - Kenny Mohr
/// - Evigenios Chontzidis
/// - Salih Erkan
/// - Björg Schneider
/// 
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              MyTolleListe(), 
              
            ])
        ),
      ),
    );
  }
}

class MyTolleListe extends StatefulWidget {
  const MyTolleListe({super.key});

  @override
  State<MyTolleListe> createState() => _MyTolleListeState();
}

class _MyTolleListeState extends State<MyTolleListe> {
  List<String> listeImState = ["Bier", "Wein", "Sekt", "Schnaps", "Whiskey"];

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: listeImState.length,
          itemBuilder: (context, index) => ListTile(title: Text(listeImState[index]),) ),
          ElevatedButton(onPressed: () { iDeleteTheLastPosition(); }, child: Text("Letzte Position löschen!"))      
      ],
    );
  }

  // Korrekt:
  void iDeleteTheLastPosition() { setState(() { 
    listeImState.removeLast(); } ); 
  }

  // FALSCH:
  void iDeleteTheLastPositionWrong() { () => setState(() {
    listeImState.removeLast(); } ); 
  }

  // Korrekt, LAMBDA-Variante
  void iDeleteTheLastPositionLambda() => setState( () => listeImState.removeLast() );
  
}