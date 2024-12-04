import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Device { Euro, Riel, Dong }

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  Device? divice = Device.Riel;
  TextEditingController _dollar = TextEditingController();
  double result = 0;

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  // Method to update the result based on the selected device
  void updateConversion() {
    double dollarValue = double.tryParse(_dollar.text) ?? 0;

    setState(() {
      if (divice == Device.Dong) {
        result = dollarValue * 25410;
      } else if (divice == Device.Riel) {
        result = dollarValue * 4038.45;
      } else if (divice == Device.Euro) {
        result = dollarValue * 0.95;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.money,
              size: 60,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Amount in dollars:"),
            const SizedBox(height: 10),
            TextField(
              controller: _dollar,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollar',
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                updateConversion(); // Update the result when dollar amount changes
              },
            ),
            const SizedBox(height: 30),
            DropdownButton<Device>(
              value: divice,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (Device? value) {
                setState(() {
                  divice = value;
                });
                // will change depend on divice
                updateConversion();
              },
              items: Device.values.map((Device value) {
                return DropdownMenuItem<Device>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            const Text("Amount in selected device:"),
            const SizedBox(height: 10),
            Container(
              child: divice == Device.Riel
                  ? Text("${result.toString()} Riel")
                  : divice == Device.Euro
                  ? Text("${result.toString()} Euro")
                  : divice == Device.Dong
                  ? Text("${result.toString()} Dong")
                  : null,
            ),

          ],
        ),
      ),
    );
  }
}
