import 'dart:math';

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> with TickerProviderStateMixin {
  TabController _tabController;

  final _styleTextBold = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        controller: _tabController,
        items: [
          TabItem(
            icon: Icons.home,
            title: 'Inicio',
          ),
          TabItem(
            icon: Icons.insert_chart,
            title: 'Llamar',
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(Icons.drag_handle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _Page1(styleTextBold: _styleTextBold),
          _Page2(),
        ],
      ),
    );
  }
}

class _Page2 extends StatelessWidget {
  const _Page2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Text('''
Ejemplo de Lorem ipsum
Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías o de borradores de diseño para probar el diseño visual antes de insertar el texto final.

Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica Richard McClintock asegura que su uso se remonta a los impresores de comienzos del siglo XVI.1​ Su uso en algunos editores de texto muy conocidos en la actualidad ha dado al texto lorem ipsum nueva popularidad.

El texto en sí no tiene sentido, aunque no es completamente aleatorio, sino que deriva de un texto de Cicerón en lengua latina, a cuyas palabras se les han eliminado sílabas o letras. El significado del texto no tiene importancia, ya que solo es una demostración o prueba, pero se inspira en la obra de Cicerón De finibus bonorum et malorum (Sobre los límites del bien y del mal) que comienza con:

Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit2​
A pesar de estar extraído de ese escrito, el texto usado habitualmente[cita requerida] es:

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Existen múltiples variantes del texto original, algunas casi sin parecido con él. Estas versiones incluyen letras adicionales que no son comunes en latín (como la k, w y z) o palabras sin sentido como zzril, takimata y gubeergren que intentan hacer la distribución aún más parecida al inglés.

Varios editores de texto proveen la funcionalidad de generación de lorem ipsum.'''),
      ),
    );
  }
}

class _Page1 extends StatefulWidget {
  _Page1({
    Key key,
    @required TextStyle styleTextBold,
  })  : _styleTextBold = styleTextBold,
        super(key: key);

  final TextStyle _styleTextBold;

  @override
  __Page1State createState() => __Page1State();
}

class __Page1State extends State<_Page1> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo color morado
        FractionallySizedBox(
          heightFactor: 0.40,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
              color: Colors.deepPurple,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Parte de arriba Covid-19 con banderas
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Covid-19',
                      style: widget._styleTextBold,
                    ),
                    // Expanded(child: Container()),
                    Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: StadiumBorder(),
                      ),
                      width: 150.0,
                      height: 40.0,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '¿Te sientes enfermo?',
                        style: widget._styleTextBold,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Si presentas algun síntoma 🤢😵 por favor llámanos o envíanos un mensaje',
                        style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: FlatButton.icon(
                          onPressed: () {
                            Navigator.of(context).pushNamed('segunda_page');
                          },
                          label: Text(
                            'Llamar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          icon: Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                          shape: StadiumBorder(),
                          color: Colors.red,
                          splashColor: Colors.transparent,
                        ),
                      ),
                      SizedBox(width: 30.0),
                      Expanded(
                        child: FlatButton.icon(
                          onPressed: () {
                            setState(() {
                              Random r = Random();

                              _width = r.nextInt(255).toDouble();
                              _height = r.nextInt(255).toDouble();
                              _color = Color.fromRGBO(r.nextInt(255), r.nextInt(255), r.nextInt(255), 1.0);
                            });
                          },
                          label: Text(
                            'SMS',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          icon: Icon(
                            Icons.sms,
                            color: Colors.white,
                          ),
                          shape: StadiumBorder(),
                          color: Colors.blue,
                          splashColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // fin Fondo color morado

        InputChip(
          avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: Text('AB'),
          ),
          label: Text('Aaron Burr'),
          onPressed: () {
            print('I am the one thing in life.');
          },
        ),
        Positioned(
          bottom: 260,
          child: AnimatedContainer(
            // Use the properties stored in the State class.
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            // Define how long the animation should take.
            duration: Duration(milliseconds: 400),
            // Provide an optional curve to make the animation feel smoother.
            curve: Curves.bounceInOut,
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 10.0,
          child: Hero(
            tag: 'casa',
            child: Image.asset(
              'assets/img/casa.png',
              height: 100.0,
            ),
          ),
        ),
      ],
    );
  }
}
