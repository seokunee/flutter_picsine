import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  return runApp(const GaugeApp());
}

class GaugeApp extends StatelessWidget {
  const GaugeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Radial Gauge Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currentSliderValue = 0;

  Widget _getRadialGauge() {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
        GaugeRange(
            startValue: 0,
            endValue: 50,
            color: Colors.green,
            startWidth: 10,
            endWidth: 10,
            sizeUnit: GaugeSizeUnit.logicalPixel),
        GaugeRange(
            startValue: 50,
            endValue: 100,
            color: Colors.orange,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 100,
            endValue: 150,
            color: Colors.red,
            startWidth: 10,
            endWidth: 10)
      ], pointers: <GaugePointer>[
        NeedlePointer(value: _currentSliderValue, needleColor: Colors.white)
      ], annotations: <GaugeAnnotation>[
        GaugeAnnotation(
            widget: Container(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: Text(_currentSliderValue.toStringAsFixed(1),
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
              Slider(
                activeColor: Colors.green,
                value: _currentSliderValue,
                max: 150,
                divisions: 1500,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ],
          ),
        )));
  }
}
