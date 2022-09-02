import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter_piscine/bmi_output_page.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: false,
        title: const Text("BMI 계산하기"),
      ),
      body: const SafeArea(
        child: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final TextEditingController _hContoller = TextEditingController();
  final TextEditingController _wContoller = TextEditingController();

  bool switchOnOff = true;

  @override
  void initState() {
    super.initState();
    _hContoller;
    _wContoller;
  }

  @override
  void dispose() {
    _hContoller.dispose();
    _wContoller.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(25),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      }
                      return "키를 입력해주세요";
                    },
                    controller: _hContoller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "키를 입력해주세요 : cm",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: switchOnOff,
                    keyboardType: switchOnOff
                        ? TextInputType.visiblePassword
                        : TextInputType.number,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      }
                      return "몸무게를 입력해주세요";
                    },
                    controller: _wContoller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "몸무게를 입력해주세요 : kg",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CupertinoSwitch(
                    // This bool value toggles the switch.
                    value: switchOnOff,
                    // thumbColor: Color.fromARGB(255, 153, 21, 176),
                    // trackColor: CupertinoColors.systemRed.withOpacity(0.14),
                    activeColor: const Color.fromARGB(255, 196, 74, 244)
                        .withOpacity(0.64),
                    onChanged: (bool? value) {
                      setState(() {
                        switchOnOff = value!;
                      });
                    },
                  ),
                  Text(switchOnOff ? "Weight ****" : "Weight digit"),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final height = double.parse(_hContoller.text);
                              final weight = double.parse(_wContoller.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BmiResult(
                                        bmi: weight / pow(height / 100, 2))),
                              );
                            }
                          },
                          child: const Text('BMI 계산', style: TextStyle()),
                        ),
                      )
                    ],
                  ),
                ],
              ))),
    );
  }
}
