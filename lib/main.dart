import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora Acadêmica'),
        ),
        body: CalculatorScreen(),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController tr1Controller = TextEditingController();
  TextEditingController tr2Controller = TextEditingController();
  TextEditingController tr3Controller = TextEditingController();
  TextEditingController p1Controller = TextEditingController();
  TextEditingController tr4Controller = TextEditingController();
  TextEditingController tr5Controller = TextEditingController();
  TextEditingController p2Controller = TextEditingController();
  TextEditingController tr6Controller = TextEditingController();
  TextEditingController tr7Controller = TextEditingController();
  TextEditingController p3Controller = TextEditingController();
  TextEditingController p4Controller = TextEditingController();
  TextEditingController tr8Controller = TextEditingController();
  TextEditingController tr9Controller = TextEditingController();
  TextEditingController subController = TextEditingController();

  String nomeAluno = 'João Vitor Zavisas Terassi Morais';
  String raAluno = '1431432312032';

  double calculateAverage() {
    List<double> trValues = [
      double.tryParse(tr1Controller.text) ?? 0,
      double.tryParse(tr2Controller.text) ?? 0,
      double.tryParse(tr3Controller.text) ?? 0,
      double.tryParse(tr4Controller.text) ?? 0,
      double.tryParse(tr5Controller.text) ?? 0,
      double.tryParse(tr6Controller.text) ?? 0,
      double.tryParse(tr7Controller.text) ?? 0,
      double.tryParse(tr8Controller.text) ?? 0,
      double.tryParse(tr9Controller.text) ?? 0,
    ];

    List<double> pValues = [
      double.tryParse(p1Controller.text) ?? 0,
      double.tryParse(p2Controller.text) ?? 0,
      double.tryParse(p3Controller.text) ?? 0,
      double.tryParse(p4Controller.text) ?? 0,
      double.tryParse(subController.text) ?? 0,
    ];

    double trAverage = trValues.reduce((a, b) => a + b) / trValues.length;
    double pAverage = pValues.reduce((a, b) => a + b) / pValues.length;

    return (trAverage * 0.4) + (pAverage * 0.6);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            'Nome do Aluno:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(nomeAluno),
          const Text(
            'RA do Aluno:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(raAluno),
          const Text(
            'Notas TR (Trabalhos):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          buildTextField('TR1', tr1Controller),
          buildTextField('TR2', tr2Controller),
          buildTextField('TR3', tr3Controller),
          buildTextField('TR4', tr4Controller),
          buildTextField('TR5', tr5Controller),
          buildTextField('TR6', tr6Controller),
          buildTextField('TR7', tr7Controller),
          buildTextField('TR8', tr8Controller),
          buildTextField('TR9', tr9Controller),
          const Text(
            'Notas P (Provas):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          buildTextField('P1', p1Controller),
          buildTextField('P2', p2Controller),
          buildTextField('P3', p3Controller),
          buildTextField('P4', p4Controller),
          const Text(
            'Nota SUB:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          buildTextField('SUB', subController),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              double average = calculateAverage();
              String status = average >= 6.0 ? 'Aprovado' : 'Reprovado';

              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Resultado'),
                  content: Text('Média: $average\nStatus: $status'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Fechar'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Calcular Média'),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
