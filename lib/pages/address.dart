import 'package:flutter/material.dart';

// Classe para representar um endereço
class Address {
  final String street;
  final String complement;
  final String cityStateZip;

  Address({
    required this.street,
    required this.complement,
    required this.cityStateZip,
  });
}

class AddressScreen extends StatefulWidget {
  static const routeName = '/Address';
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  List<Address> addresses = [
    Address(
      street: 'Rua Fulano de Tal, Madalena',
      complement: '105, apto 201',
      cityStateZip: 'Recife, Pernambuco, 50000-000',
    ),
  ];

  // Endereço selecionado
  Address? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Endereços'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            Text(
              'Selecione seu endereço',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Card para endereço atual
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.green),
                title: Text('Selecionar endereço atual'),
                onTap: () {
                  // Ação ao selecionar o endereço atual
                },
              ),
            ),
            const Divider(height: 32),
            // Lista de endereços
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  final isSelected = address == selectedAddress;
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            isSelected ? Colors.green : Colors.transparent,
                        child: isSelected
                            ? Icon(Icons.check, color: Colors.white)
                            : null,
                      ),
                      title: Text(address.street),
                      subtitle: Text(
                          '${address.complement}\n${address.cityStateZip}'),
                      isThreeLine: true,
                      onTap: () {
                        setState(() {
                          selectedAddress = address;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            // Adicionar novo endereço
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.add, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Text('Adicione um endereço'),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, foregroundColor: Colors.white),
          onPressed: () {
            Navigator.of(context).pushNamed('/ConfirmBuying');
          },
          child: Text(
            'Confirmar',
          ),
        ),
      ),
    );
  }
}
