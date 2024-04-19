import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String gameIcon = 'assets/images/3151590_galaga_game_retro_video_icon.svg';
  String emojiIcon = 'assets/images/2993606_emoji_emote_emoticon_emoticons_wink_icon.svg';
  String defeatMessage = 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500.';
  String victoryMessage = 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500.';


  void _decrementCounter() {
    
    setState(() {
      _counter--;
    });
  }
  void _incrementCounter() {
    
    setState(() {
      _counter++;
      if (_counter == 10 ){
        gameIcon = 'assets/images/3151548_over_sign_videogame_icon.svg';
      }
      else if (_counter == 15 ){
        gameIcon = 'assets/images/2993606_emoji_emote_emoticon_emoticons_wink_icon.svg';
      }
      else {
        gameIcon = 'assets/images/3151590_galaga_game_retro_video_icon.svg';
      }
    
    });
  }
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor:  Colors.blue[900],
        foregroundColor: Colors.blue[50],
        title: Text(widget.title),
      ),
      body: 
        
      Center(
        widthFactor: 6,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 5,
                child: 
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Lograste $_counter puntos',
                                style: Theme.of(context).textTheme.headlineLarge,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset(
                                  gameIcon,
                                  width: 80,
                                  ),
                              ],
                            ),
                            Text(defeatMessage),
                            Center(    
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(onPressed: _incrementCounter, child: const Text('More')),
                                  const SizedBox(width: 25,),
                                  ElevatedButton(onPressed: _resetCounter, child: SvgPicture.asset(emojiIcon)),
                                  ElevatedButton(onPressed: _decrementCounter, child: const Text('Less')),
                                ],
                              ),
                            )
                          ],
                        ),),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.fifteen_mp),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
