import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  home: GasolinaApp(),
));

class GasolinaApp extends StatefulWidget{
  @override
  _GasolinaAppState createState() => _GasolinaAppState();
}

class _GasolinaAppState extends State<GasolinaApp> {
  
  static const Color corFundo = Color.fromARGB(255, 7, 0, 82); 
  static const Color corCard = Color(0xFF1A1A1A); 
  static const Color corPrimaria = Color.fromARGB(255, 209, 208, 209); 
  static const Color corSecundaria = Color.fromARGB(255, 136, 134, 152); 
  static const Color corTexto = Color.fromARGB(255, 233, 233, 233); 
  static const Color corTextoCinza = Color.fromARGB(255, 170, 158, 179); 
  static const Color corBorda = Color.fromARGB(255, 0, 7, 222); 

  final TextEditingController _gasolinaController = TextEditingController();
  final TextEditingController _etanolController = TextEditingController();

  String _resultado = "";


  void _calcular(){
    final double gasolina = double.tryParse(_gasolinaController.text)?? 0.0;
    final double etanol = double.tryParse(_etanolController.text)?? 0.0;
    final double coef = etanol/gasolina;
    final String coefString = coef <= 0.7 ? 'Etanol' : 'Gasolina';
    final String coefStringDecimal = coef.toStringAsFixed(2);

    if (etanol <= 0 && gasolina <= 0){
      setState(() {
        _resultado = 'Informe o valor dos combustiveis';
      });
      return;
    }else if (etanol < 0 || gasolina < 0){
      setState(() {
        _resultado = 'informe o valor dos combustiveis';
      });
      return;
    }
    setState(() {
      _resultado = 'O coeficiente é $coefStringDecimal\n''O melhor combustivel para abastecer é: $coefString';
    });
  }

  @override
  Widget build(BuildContext context){
    // Esqueleto visual da tela - como a tag <HMTL>
    return Scaffold( 
      // LOCAL ONDE FICARÃO A MAIORIA DOS NOSSOS ELEMENTOS
      backgroundColor: corFundo,

      // SEMELHANTE AO HEADER
      appBar: AppBar(
        backgroundColor: corCard,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Bem-vindo a Calculadora de Combustivel.",
          style: TextStyle(
            color: corSecundaria,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [

            SizedBox(height: 16,),
            // AQUI É ONDE ESTARÃO OS NOSSO ELEMENTOS/WIDGETS
            
            SizedBox(height: 36),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: corCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: corBorda, width: 1),
              ),  
            child: Text(
              "Informe os valores do combustivel",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: corTextoCinza,
                height: 1.5,
              ),
            ),
            ),
            
            SizedBox(height: 28),
            _buildCampo(
              controller: _gasolinaController,
              label: 'Valor da Gasolina',
              icone: Icons.local_gas_station_sharp,
            ),
            SizedBox(height: 16),
            _buildCampo(
              controller: _etanolController,
              label: 'Valor do etanol',
              icone: Icons.local_gas_station_sharp,
              ),
            SizedBox(height: 16,),
            
            ElevatedButton(
              onPressed: _calcular, // Tudo que é criado pelo programador coloca _nome
              style: ElevatedButton.styleFrom(
                backgroundColor: corPrimaria,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(14)
                ),
                elevation: 6,
                shadowColor: corPrimaria.withOpacity(0.5),
              ),
              child: Text(
                'Calcular',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                ),
              ),
              SizedBox(height: 36,),
              if (_resultado.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: corCard,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: corBorda,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: corSecundaria.withOpacity(0.2),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ]
                  ),
                  child: Column(children: [
                    Text(
                      "Você vai precisar de: ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: corPrimaria,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      _resultado,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        height: 2.0,
                        color:corTexto, 
                      ),
                    )
                  ],),
                ),
          ],
        ),
      ),
    );
  }
  Widget _buildCampo({
  required TextEditingController controller,
  required String label,
  required IconData icone,
}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    style: TextStyle(color: corTexto, fontSize: 16),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: corTextoCinza),
      prefixIcon: Icon(icone, color: corPrimaria,),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: corBorda, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: corPrimaria, width: 2),
      ),
      filled: true,
      fillColor: corCard,
    ),
  );
}
}

