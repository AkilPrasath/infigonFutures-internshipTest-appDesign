import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatelessWidget {
  const RadialGauge({
    Key key,
    @required this.height,
    @required this.width,
    @required this.color,
    @required this.value,
  }) : super(key: key);

  final double height;
  final double width;
  final Color color;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: 270,
          endAngle: 270,
          axisLineStyle: AxisLineStyle(
            thickness: 0.05,
            color: Colors.transparent,
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          pointers: <GaugePointer>[
            RangePointer(
              value: value,
              width: 0.15,
              color: color,
              pointerOffset: 0.1,
              cornerStyle: CornerStyle.bothCurve,
              sizeUnit: GaugeSizeUnit.factor,
            )
          ],
        )
      ]),
    );
  }
}
