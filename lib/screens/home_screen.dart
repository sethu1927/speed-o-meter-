
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_speed/screens/map_screen.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../providers/speed_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(' Vehicle Speedmeter '),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Consumer(
              builder: (context, speedprovider,child ){
              return SfRadialGauge(
                axes: <RadialAxis> [
                  RadialAxis(
                    maximum: 200,
                    minimum: 0,

                    ranges: <GaugeRange>[
                      GaugeRange(startValue: 0, endValue: 40,color:  Colors.grey,),
                      GaugeRange(startValue: 40, endValue: 80,color:  Colors.green,),
                      GaugeRange(startValue: 80, endValue: 120,color:  Colors.red,),
                      GaugeRange(startValue: 120, endValue: 200,color:  Colors.orangeAccent,),
                    ],

                    pointers: <GaugePointer>[
                     // NeedlePointer(value: speedprovider!.speed),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(widget:
                      Text(" ${ speedprovider!.speed.toStringAsFixed(0)}  Km/h ",  style: TextStyle(  fontSize: 20, fontWeight: FontWeight.bold),),
                        angle: 90, positionFactor: 0.8,
                      )
                    ],
                  )

                ],
              );
          }),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            final speedprovider = Provider.of (context,listen: false);
            speedprovider.setSpeed((speedprovider.speed + 10)% 180);
          }, child: Text('increase Speed')),
          SizedBox(
            height: 30,
          ),

          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapScreen()),
            );
          }, child: Text('Show Map'))
        ],
      ),



    );
  }
}
