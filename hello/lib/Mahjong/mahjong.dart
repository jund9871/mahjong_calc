import 'package:flutter/material.dart';
import 'package:hello/Mahjong/devider.dart';
import 'package:hello/Mahjong/hand.dart';
import 'package:hello/Mahjong/hand_config.dart';
import 'package:hello/Mahjong/meld.dart';
import 'package:hello/Mahjong/tile.dart';
import 'constants.dart';

void main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget{
  const myApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'mahjong test',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

makeMeld(String meldType, {bool isOpen = true, String man = '', String pin = '', String sou = '', String honors = ''}){
  var tiles = TilesConverter().stringTo136Array(sou: sou, pin: pin, man: man, honors: honors);
  Meld meld = Meld(meldType, tiles, opened: isOpen, calledTile: int.parse(tiles[0]), who: 0);
  return meld;
}

// var hand = HandDivider();
var hand = handCalculator();
handConfig config = handConfig();

// List tiles34 = TilesConverter().stringTo34Array(sou: '23455', man: '234567', honors: '777');
List tiles34 = TilesConverter().stringTo136Array(man: '119', pin: '19', sou: '19', honors: '1234567');
int winTile = int.parse(TilesConverter().stringTo136Array(man: '9')[0]);
// List melds = [makeMeld('pon', man: '444')];
// List<int> doraIndicators = [
//   int.parse(TilesConverter().stringTo136Array(man: '1')[0]),
//   int.parse(TilesConverter().stringTo136Array(man: '1')[0]),
//   int.parse(TilesConverter().stringTo136Array(man: '1')[0]),
//   int.parse(TilesConverter().stringTo136Array(man: '1')[0])
// ];


class _MyHomePageState extends State<MyHomePage> {
  // List result = hand.divideHand(tiles34);
  var result = hand.estimateHandValue(tiles34, winTile, [], []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('마작 테스트', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Column(
        children: [
          Text('$result', style: const TextStyle(fontSize: 15),),
        ],
      ),
    );
  }
}