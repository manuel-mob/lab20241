import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class MyColorMixingScreen extends StatefulWidget {
  const MyColorMixingScreen({super.key});

  @override
  _MyColorMixingScreenState createState() => _MyColorMixingScreenState();
}

class _MyColorMixingScreenState extends State<MyColorMixingScreen> {
  Color color1 = Colors.red;
  Color color2 = Colors.blue;
  Color mixedColor = Colors.purple;
  String color1Name = ColorNames.guess(Colors.red);
  String color2Name = ColorNames.guess(Colors.blue);
  String colorNameGuessed = ColorNames.guess(Colors.purple);
  bool _visible = true;
  Color border1 = Colors.black;
  Color border2 = Colors.black;
  
  void _handleColor1Changed(Color newColor) {
    setState(() {
      color1 = newColor;
      mixedColor = mixColors(color1, color2); // Update mixed color
      colorNameGuessed = ColorNames.guess(mixedColor);
      color1Name = ColorNames.guess(color1);
      _visible = !_visible;
    });
  }

  void _handleColor2Changed(Color newColor) {
    setState(() {
      color2 = newColor;
      mixedColor = mixColors(color1, color2); // Update mixed color
      colorNameGuessed = ColorNames.guess(mixedColor);
      color2Name = ColorNames.guess(color2);
      _visible = !_visible;
    });
  }

  Color mixColors(Color color1, Color color2) {
    final red = (color1.red + color2.red) / 2;
    final green = (color1.green + color2.green) / 2;
    final blue = (color1.blue + color2.blue) / 2;
    return Color.fromARGB(255, red.toInt(), green.toInt(), blue.toInt());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Mixer'),
      ),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    //showDialogPicker(context);
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: color1,
                              onColorChanged: _handleColor1Changed,
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('Got it'),
                              onPressed: () {
                                //setState(() => currentColor = pickerColor);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    //END
                  },
                  child: Column(
                    children: [
                      Text(color1Name, style:const TextStyle(fontSize: 45)),
                      const SizedBox(height: 10),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black 
                          ),
                          color: color1,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //showDialogPicker(context);
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: color2,
                              onColorChanged: _handleColor2Changed,
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('Got it'),
                              onPressed: () {
                                //setState(() => currentColor = pickerColor);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    //END
                  },
                  child: Column(
                    children: [
                      Text(color2Name, style:const TextStyle(fontSize: 45)),
                      const SizedBox(height: 10),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black 
                          ),
                          color: color2,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 2000),
              child: 
                Container(
                  width: 105,
                  height: 105,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2
                    ),
                    color: Colors.black,
                    shape: BoxShape.circle
                  )
                  ,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: mixedColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ),
            const SizedBox(height: 20),
            Text(colorNameGuessed, style:const TextStyle(fontSize: 45))
          ],
        ),
      ),
    );
  }
}
