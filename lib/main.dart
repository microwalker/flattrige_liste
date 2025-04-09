import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/// ListView-Projekt mit ListViewBuilder
/// von:
/// - Kenny Mohr
/// - Evigenios Chontzidis
/// - Leon Bösche
/// - Björg Schneider
/// 
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 48),
              Card(margin: EdgeInsets.all(16), elevation: 8, child: MyTolleListe()), 
              Text("...ist alles was man braucht 😜!")
            ])
          )
        )
      ),
    );
  }
}

class MyTolleListe extends StatefulWidget {
  final List<String> listeImWidget = const ["Bier", "Wein", "Sekt", "Champagner", "Schnaps", "Whiskey", "Tequila", "Wodka"];
  const MyTolleListe({super.key});

  @override
  State<MyTolleListe> createState() => _MyTolleListeState();
}

class _MyTolleListeState extends State<MyTolleListe> {
  List<String> listeImState = []; 

  @override
  void initState() {
    listeImState = [ ...widget.listeImWidget ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Column(mainAxisAlignment: MainAxisAlignment.spaceAround, spacing: 16,
      children: [
        SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton(onPressed: () { iDeleteTheLastPosition(); }, child: Text("Letzte Position löschen!")),
          ElevatedButton(onPressed: () { iRestoreTheNextPosition(); }, child: Text("Liste wieder erweitern!"))]),              
        ListView.builder(
          shrinkWrap: true,
          itemCount: listeImState.length,
          itemBuilder: (context, index) => ListTile(onTap: () {}, leading: Icon(Icons.liquor_outlined), trailing: Icon(Icons.medical_services), title: Text(listeImState[index]))),
      ],
    );
  }

  // Korrekt:
  void iDeleteTheLastPosition() { 
    setState(() { 
      if(listeImState.isNotEmpty) {
        listeImState.removeLast(); }}); 
  }

  void iRestoreTheNextPosition() {
    setState(() {
      if(listeImState.length < widget.listeImWidget.length) {
        listeImState.add(widget.listeImWidget[listeImState.length]);
      } 
    });
  }

  // FALSCH:
  void iDeleteTheLastPositionWrong() { () => setState(() {
    listeImState.removeLast(); } ); 
  }

  // Korrekt, LAMBDA-Variante
  void iDeleteTheLastPositionLambda() => setState( () => listeImState.removeLast() );
  
}