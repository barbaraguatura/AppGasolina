// IMPORTS - material
import 'package:flutter/material.dart';

// ETAPA 1 - Esqueleto da tela
// Objetivo: entender a estrutura de um app Flutter

void main() => runApp(MaterialApp(
  home: GasolinaApp(),
  )); // MaterialApp

  class GasolinaApp extends StatelessWidget{

    String _resultado = "";
    void _calcular(){
      
    }
    @override
    Widget build(BuildContext context){
      // esqueleto visual da tela - como a tag <html>
      return Scaffold(
        // LOCAL ONDE FICARÃO A MAIORIA DOS NOSSOS ELEMENTOS

        //semelhante ao header
        appBar: AppBar (
          title: Text('Qual gasolina é melhor?'),
        ), //AppBar

        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // aqui é onde estarão os nossos elementos/widgets
            Text(
              'Bem vindo ao posto de gasolina!',
              style: TextStyle(fontSize:19,),
            ),
            SizedBox(height:19,),

            Text(
              'informe o preço de combustíveis',
              style: TextStyle(fontSize:19,),
            ),
            SizedBox(height:19,),

            TextField(
              decoration: InputDecoration(
                labelText: 'Preço da Gasolina: 6,29',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16,),

             TextField(
              decoration: InputDecoration(
                labelText: 'Preço do Etanol: 5,90',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calcular,
              child: Text('calcular'),
            ),
            SizedBox(height: 36),
            Text(
              _resultado,
              style: TextStyle(fontSize:16),
              textAlign: TextAlign.center,
            ),
            ],
          ),
        ),
      );
    }
  }