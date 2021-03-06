import 'package:flutter/material.dart';

import 'package:qrreader_app/src/pages/direcciones_page.dart';
import 'package:qrreader_app/src/pages/mapas_page.dart';

import 'package:barcode_scan/barcode_scan.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: (){}
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scanQR(),
        backgroundColor: Theme.of(context).primaryColor,
      ),

    );
  }

  _scanQR() async {
    //https://www.zentag.io
    //geo: -17.784161988650467, -63.179601578320344
    dynamic futureString = '';
    // try {
    //   futureString = await BarcodeScanner.scan();
    // } catch (e) {
    //   futureString = e.toString();
    // }
    // print('Future String:$futureString');

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
        ),
      ],
    );
  }

  Widget _callPage( int paginaActual ){

    switch( paginaActual){
      case 0 : return MapasPage();
      case 1 : return DireccionesPage();

      default:
      return MapasPage();
    }

  }
}
