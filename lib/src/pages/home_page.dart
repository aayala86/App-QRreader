import 'package:flutter/material.dart';
import 'package:qrreader_app/src/pages/direcciones_page.dart';
import 'package:qrreader_app/src/pages/mapas_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cargarPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
    );
  }

  Widget _crearBottomNavigationBar () {

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapa')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('Direcciones')
        )
      ],
    );
  }

  Widget _cargarPage( int paginaActual ){

    switch( paginaActual){
      case 0 : return MapasPage();
      case 1 : return DireccionesPage();

      default:
      return MapasPage();
    }

  }
}
