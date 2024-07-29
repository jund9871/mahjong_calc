import 'package:hello/Mahjong/tile.dart';

class Meld{
  String chi = 'chi';
  String pon = 'pon';
  String kan = 'kan';
  String shouminkan = 'shouminkan';
  String nuki = 'nuki';

  String meldType;
  List tiles;
  bool opened;
  int? calledTile;
  int? who;
  int? fromWho;

  Meld(this.meldType, this.tiles, {this.opened = true, this.calledTile = null, this.who = null, this.fromWho = null});

  tiles34(){
    int i = 0;
    List temp = [];
    for(int i = 0; i < tiles.length; i++){
      temp.add(int.parse(tiles[i]) ~/ 4);
    }
    return temp;
  }
}
