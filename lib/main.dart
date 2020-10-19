import 'package:flutter/material.dart';
import 'package:covid_curso_tec/src/pages/inicio_page.dart';
import 'package:covid_curso_tec/src/pages/segunda_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curso',
      // home: InicioPage(),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => InicioPage(),
        'segunda_page': (BuildContext context) => SegundaPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
    );
  }
}