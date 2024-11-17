import 'package:flutter/material.dart';


enum ButtonType { primary, secondary, disabled }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool iconPositionLeft;
  final ButtonType buttonType;

  CustomButton({
    Key? key,
    required this.label,
    required this.icon,
    this.iconPositionLeft = true,
    this.buttonType = ButtonType.primary,
  });


  Color _getButtonColor() {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: () {
        print("$label button pressed!");
      },

      style: ElevatedButton.styleFrom(
        backgroundColor: _getButtonColor(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17), // Set button padding
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: iconPositionLeft
            ? [
          Icon(icon, size: 16),
          SizedBox(width: 8),
          Text(label),
              // Button label
        ]
            : [
          Text(label),
          SizedBox(width: 8),
          Icon(icon, size: 16),
        ],
      ),
    );
  }
}

// Usage Example
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Buttons Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CustomButton(
              label: "Submit",
              icon: Icons.check,
              iconPositionLeft: true,
              buttonType: ButtonType.primary,
            ),
            SizedBox(height: 16),

            CustomButton(
              label: "Time",
              icon: Icons.access_time,
              iconPositionLeft: false,
              buttonType: ButtonType.secondary,
            ),
            SizedBox(height: 16),

            CustomButton(
              label: "Account",
              icon: Icons.account_circle,
              iconPositionLeft: true,
              buttonType: ButtonType.disabled,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}
