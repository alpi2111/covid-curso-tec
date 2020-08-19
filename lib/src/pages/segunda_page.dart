import 'package:flutter/material.dart';

class SegundaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda pagina'),
      ),
      body: Hero(
        tag: 'casa',
        child: Image.asset('assets/img/casa.png'),
      ),
    );
  }
}
