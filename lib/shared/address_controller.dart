import 'package:flutter/material.dart';

class ProductDelivery extends StatefulWidget {
  @override
  _ProductDeliveryState createState() => _ProductDeliveryState();
}

class _ProductDeliveryState extends State<ProductDelivery> {
  // Controladores para os campos de texto
  TextEditingController _ruaController = TextEditingController();
  TextEditingController _complementoController = TextEditingController();
  TextEditingController _cidadeController = TextEditingController();
  TextEditingController _estadoController = TextEditingController();
  TextEditingController _cepController = TextEditingController();

  // Variável que armazena o endereço completo
  String _endereco = 'Rua Exemplo, 123 - Cidade, Estado - CEP: 12345-678';

  // Função para salvar o endereço preenchido pelo usuário
  void _salvarEndereco() {
    setState(() {
      _endereco =
          '${_ruaController.text}, ${_complementoController.text} - ${_cidadeController.text}, ${_estadoController.text} - CEP: ${_cepController.text}';
    });
  }

  // Função que exibe o formulário para o usuário preencher o endereço
  void _mostrarFormularioEndereco() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Digite o Endereço Completo'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _ruaController,
                  decoration: const InputDecoration(labelText: "Rua"),
                ),
                TextField(
                  controller: _complementoController,
                  decoration: const InputDecoration(labelText: "Complemento"),
                ),
                TextField(
                  controller: _cidadeController,
                  decoration: const InputDecoration(labelText: "Cidade"),
                ),
                TextField(
                  controller: _estadoController,
                  decoration: const InputDecoration(labelText: "Estado"),
                ),
                TextField(
                  controller: _cepController,
                  decoration: const InputDecoration(labelText: "CEP"),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                _salvarEndereco();
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Delivery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Endereço de Entrega',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(_endereco),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: _mostrarFormularioEndereco,
                        child: const Text('Mudar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
