import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Category? selectedCategory  ;
  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onAdd() {
    if (_titleController.text == '') {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Invalid input"),
          content: Text("The title cannot be empty"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OKAY"),
                ),
              ],
            ),
          ],
        ),
      );
      return;
    }


    final value = double.tryParse(_valueController.text);
    if (value == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Invalid input"),
          content: Text("The amount must be a valid number"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OKAY"),
                ),
              ],
            ),
          ],
        ),
      );
      return;
    }


    String title = _titleController.text;
    double amount = value;


    Expense expense = Expense(
      title: title,
      amount: amount,
      date: selectedDate,
      category:selectedCategory??Category.food,
    );


    widget.onCreated(expense);


    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller: _valueController,
            maxLength: 50,
            decoration: const InputDecoration(
              prefix: Text('\$ '),
              label: Text('Amount'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text("${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year}   "),
                  IconButton(
                    onPressed: () => _selectDate(context),
                    icon: const Icon(Icons.calendar_today),
                  ),
                ],
              ),
            ],
          ),


          DropdownButton<Category>(
            value: selectedCategory,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (Category? value) {
              setState(() {
                selectedCategory = value;
              });
            },
            items: Category.values.map((Category value) {
              return DropdownMenuItem<Category>(
                value: value,
                child: Text(value.name),
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(width: 20),
              ElevatedButton(onPressed: onAdd, child: const Text('Create')),
            ],
          ),
        ],
      ),
    );
  }
}
