import 'package:calculator/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'Del',
    '%',
    'x',
    '9',
    '8',
    '7',
    '/',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 55,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userQuestion,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userAnswer,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SimButtons(
                    buttontap: () {
                      setState(() {
                        userQuestion = '';
                        userAnswer = '';
                      });
                    },
                    buttonText: buttons[index],
                    color: Colors.green,
                    textcc: Colors.white,
                  );
                } else if (index == 1) {
                  return SimButtons(
                    buttontap: () {
                      setState(() {
                        userQuestion =
                            userQuestion.substring(0, userQuestion.length - 1);
                      });
                    },
                    buttonText: buttons[index],
                    color: Colors.red,
                    textcc: Colors.white,
                  );
                } else if (index == buttons.length - 1) {
                  return SimButtons(
                    buttontap: () {
                      setState(() {
                        equalPressed();
                      });
                    },
                    color: Colors.deepPurple,
                    buttonText: buttons[index],
                    textcc: Colors.white,
                  );
                } else {
                  return SimButtons(
                    buttontap: () {
                      setState(() {
                        userQuestion += buttons[index];
                      });
                    },
                    buttonText: buttons[index],
                    color: isColor(buttons[index])
                        ? Colors.deepPurple
                        : Colors.white,
                    textcc:
                        isColor(buttons[index]) ? Colors.white : Colors.black,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  bool isColor(String x) {
    if (x == 'x' || x == '%' || x == '/' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

   equalPressed() {
    String finalAnswer = userQuestion;
    finalAnswer = userQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalAnswer);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
