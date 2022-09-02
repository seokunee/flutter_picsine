import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiResult extends StatefulWidget {
  const BmiResult({Key? key, required this.bmi}) : super(key: key);
  final double bmi;

  @override
  State<BmiResult> createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult> {
  Widget _getRadialGauge() {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(minimum: 0, maximum: 50, ranges: <GaugeRange>[
        GaugeRange(
            startValue: 0,
            endValue: 18.5,
            color: Colors.blue,
            startWidth: 20,
            endWidth: 20,
            label: "저체중",
            sizeUnit: GaugeSizeUnit.logicalPixel),
        GaugeRange(
            startValue: 18.5,
            endValue: 23,
            color: Colors.green,
            label: "정상",
            startWidth: 20,
            endWidth: 20),
        GaugeRange(
            startValue: 23,
            endValue: 25,
            label: "과체중",
            color: Colors.orange,
            startWidth: 20,
            endWidth: 20),
        GaugeRange(
            startValue: 25,
            endValue: 50,
            label: "비만",
            color: Colors.red,
            startWidth: 20,
            endWidth: 20)
      ], pointers: <GaugePointer>[
        NeedlePointer(value: widget.bmi, needleColor: Colors.white)
      ], annotations: <GaugeAnnotation>[
        GaugeAnnotation(
            widget: Container(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: Text(widget.bmi.toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
            angle: 90,
            positionFactor: 0.5)
      ])
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Flutter Gauge'),
            centerTitle: false,
            backgroundColor: Colors.black54),
        body: Center(
            child: Container(
          alignment: Alignment.center,
          color: Colors.black87,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              _getRadialGauge(),
            ],
          ),
        )));
  }
}
