import 'dart:ffi';

import 'package:calculator_3/newcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

Color colorDark = const Color(0xff374352);
Color colorLight = const Color(0xffe6eeff);

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int? num1;
  int? num2;
  String history = "";
  String textToDisplay = "";
  String? res;
  String? operation;

  void buttonOnClick(String buttonValue) {
    print(buttonValue);
    if (buttonValue == "C") {
      textToDisplay = "";
      num1 = 0;
      num2 = 0;
      res = "";
    } else if (buttonValue == "AC") {
      textToDisplay = "";
      num1 = 0;
      num2 = 0;
      res = "";
      history = "";
    } else if (buttonValue == "+" ||
        buttonValue == "-" ||
        buttonValue == "x" ||
        buttonValue == "/") {
      num1 = int.parse(textToDisplay);
      res = "";
      operation = buttonValue;
    } else if (buttonValue == "=") {
      num2 = int.parse(textToDisplay);
      if (buttonValue == "+") {
        res = (num1! + num2!).toString();
        history = num1.toString() + operation.toString() + num2.toString();
      }
      if (buttonValue == "-") {
        res = (num1! - num2!).toString();
        history = num1.toString() + operation.toString() + num2.toString();
      }
      if (buttonValue == "x") {
        res = (num1! * num2!).toString();
        history = num1.toString() + operation.toString() + num2.toString();
      }
      if (buttonValue == "/") {
        res = (num1! / num2!).toString();
        history = num1.toString() + operation.toString() + num2.toString();
      }
    } else {
      res = int.parse(textToDisplay + buttonValue).toString();
    }
    setState(() {
      textToDisplay = res!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 100),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          textToDisplay,
                          style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            history,
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttonRounded(title: "AC", callback: buttonOnClick),
                        buttonRounded(title: "C", callback: buttonOnClick),
                        buttonRounded(title: "<", callback: buttonOnClick),
                        buttonRounded(
                            title: "/",
                            callback: buttonOnClick,
                            textColor: Colors.green),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttonRounded(title: "7", callback: buttonOnClick),
                        buttonRounded(title: "8", callback: buttonOnClick),
                        buttonRounded(title: "9", callback: buttonOnClick),
                        buttonRounded(
                            title: "x",
                            callback: buttonOnClick,
                            textColor: Colors.green),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttonRounded(title: "4", callback: buttonOnClick),
                        buttonRounded(title: "5", callback: buttonOnClick),
                        buttonRounded(title: "6", callback: buttonOnClick),
                        buttonRounded(
                            title: "-",
                            callback: buttonOnClick,
                            textColor: Colors.green),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttonRounded(title: "1", callback: buttonOnClick),
                        buttonRounded(title: "2", callback: buttonOnClick),
                        buttonRounded(title: "3", callback: buttonOnClick),
                        buttonRounded(
                            title: "+",
                            callback: buttonOnClick,
                            textColor: Colors.green),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttonRounded(title: "+/-", callback: buttonOnClick),
                        buttonRounded(title: "0", callback: buttonOnClick),
                        buttonRounded(
                          title: "00",
                          callback: buttonOnClick,
                          // icon: Icons.backspace_outlined,
                          // iconColor: Colors.green,
                        ),
                        buttonRounded(
                            title: "=",
                            callback: buttonOnClick,
                            textColor: Colors.green),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buttonRounded(
    {String? title,
    IconData? icon,
    Color? iconColor,
    Color? textColor,
    required Function callback}) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: NewContainer(
      borderRadius: BorderRadius.circular(40),
      color: colorLight,
      padding: EdgeInsets.all(18),
      child: InkWell(
        onTap: () => callback(title),
        child: Container(
          width: 36,
          height: 36,
          child: Center(
            child: title != null
                ? Text(
                    "$title",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 27,
                    ),
                  )
                : Icon(
                    icon,
                    color: iconColor,
                    size: 30,
                  ),
          ),
        ),
      ),
    ),
  );
}
