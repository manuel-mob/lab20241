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
  

  void _incrementCounter() {
    
    setState(() {
      _counter++;
      if (_counter == 10 ){
        gameIcon = 'assets/images/3151548_over_sign_videogame_icon.svg';
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
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 5,
              child: 
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SvgPicture.asset(gameIcon),
                        Center(
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(onPressed: _incrementCounter, child: Text('Add')),
                              SizedBox(width: 25,),
                              ElevatedButton(onPressed: _resetCounter, child: SvgPicture.asset(emojiIcon)),
                              ElevatedButton(onPressed: _incrementCounter, child: Text('Restart')),
                            ],
                          ),
                        )
                      ],
                    ),),
                )
            ),
            SvgPicture.asset(gameIcon)
            ,
            const Text(
              'El contador va en:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
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
