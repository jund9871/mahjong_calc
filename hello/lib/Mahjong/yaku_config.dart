import 'yaku_list/tsumo.dart';
import 'yaku_list/riichi.dart';
import 'yaku_list/open_riichi.dart';
import 'yaku_list/ippatsu.dart';
import 'yaku_list/chankan.dart';
import 'yaku_list/rinshan.dart';
import 'yaku_list/haitei.dart';
import 'yaku_list/houtei.dart';
import 'yaku_list/daburu_riichi.dart';
import 'yaku_list/daburu_open_riichi.dart';
import 'yaku_list/nagashi_mangan.dart';
import 'yaku_list/renhou.dart';

import 'yaku_list/pinfu.dart';
import 'yaku_list/tanyao.dart';
import 'yaku_list/iipeiko.dart';
import 'yaku_list/haku.dart';
import 'yaku_list/hatsu.dart';
import 'yaku_list/chun.dart';

import 'yaku_list/east.dart';
import 'yaku_list/south.dart';
import 'yaku_list/west.dart';
import 'yaku_list/north.dart';
import 'yaku_list/yakuhai_place.dart';
import 'yaku_list/yakuhai_round.dart';

import 'yaku_list/sanshoku.dart';
import 'yaku_list/ittsu.dart';
import 'yaku_list/chantai.dart';
import 'yaku_list/honroto.dart';
import 'yaku_list/toitoi.dart';
import 'yaku_list/sanankou.dart';
import 'yaku_list/sankantsu.dart';
import 'yaku_list/sanshoku_douko.dart';
import 'yaku_list/chiitoitsu.dart';
import 'yaku_list/shosangen.dart';

import 'yaku_list/honitsu.dart';
import 'yaku_list/junchan.dart';
import 'yaku_list/ryanpeiko.dart';

import 'yaku_list/chinitsu.dart';

import 'yaku_list/yakuman/kokushi.dart';
import 'yaku_list/yakuman/chuuren_poutou.dart';
import 'yaku_list/yakuman/suuankou.dart';
import 'yaku_list/yakuman/daisangen.dart';
import 'yaku_list/yakuman/shosuushi.dart';
import 'yaku_list/yakuman/ryuisou.dart';
import 'yaku_list/yakuman/suukantsu.dart';
import 'yaku_list/yakuman/tsuisou.dart';
import 'yaku_list/yakuman/chinroto.dart';
import 'yaku_list/yakuman/daisharin.dart';
import 'yaku_list/yakuman/daichisei.dart';

import 'yaku_list/yakuman/daisuushi.dart';
import 'yaku_list/yakuman/daburu_kokushi.dart';
import 'yaku_list/yakuman/suuankou_tanki.dart';
import 'yaku_list/yakuman/daburu_chuuren_poutou.dart';

import 'yaku_list/yakuman/tenhou.dart';
import 'yaku_list/yakuman/chiihou.dart';
import 'yaku_list/yakuman/renhou_yakuman.dart';
import 'yaku_list/yakuman/sashikomi.dart';
import 'yaku_list/yakuman/paarenchan.dart';

import 'yaku_list/dora.dart';
import 'yaku_list/aka_dora.dart';

class yakuConfig{
  int id = 0;

  late Tsumo tsumo;
  late Riichi riichi;
  late OpenRiichi openRiichi;
  late Ippatsu ippatsu;
  late Chankan chankan;
  late Rinshan rinshan;
  late Haitei haitei;
  late Houtei houtei;
  late DaburuRiichi daburuRiichi;
  late DaburuOpenRiichi daburuOpenRiichi;
  late NagashiMangan nagashiMangan;
  late Renhou renhou;

  // Yaku 1 Han
  late Pinfu pinfu;
  late Tanyao tanyao;
  late Iipeiko iipeiko;
  late Haku haku;
  late Hatsu hatsu;
  late Chun chun;

  late YakuhaiEast yakuhaiEast;
  late YakuhaiSouth yakuhaiSouth;
  late YakuhaiWest yakuhaiWest;
  late YakuhaiNorth yakuhaiNorth;
  late YakuhaiOfPlace yakuhaiOfPlace;
  late YakuhaiOfRound yakuhaiOfRound;

  // Yaku 2 Han
  late Sanshoku sanshoku;
  late Ittsu ittsu;
  late Chantai chantai;
  late Honroto honroto;
  late Toitoi toitoi;
  late Sanankou sanankou;
  late SanKantsu sankantsu;
  late SanshokuDoukou sanshokuDoukou;
  late Chiitoitsu chiitoitsu;
  late Shosangen shosangen;

  // Yaku 3 Han
  late Honitsu honitsu;
  late Junchan junchan;
  late Ryanpeikou ryanpeiko;

  // Yaku 6 Han
  late Chinitsu chinitsu;

  // Yakuman
  late KokushiMusou kokushiMusou;
  late ChuurenPoutou chuurenPoutou;
  late Suuankou suuankou;
  late Daisangen daisangen;
  late Shousuushii shousuushii;
  late Ryuuiisou ryuuiisou;
  late Suukantsu suukantsu;
  late Tsuuiisou tsuuiisou;
  late Chinroutou chinroutou;
  late Daisharin daisharin;
  late Daichisei daichisei;

  // Double Yakuman
  late DaiSuushii daiSuushii;
  late DaburuKokushiMusou daburuKokushiMusou;
  late SuuankouTanki suuankouTanki;
  late DaburuChuurenPoutou daburuChuurenPoutou;

  // Yakuman situations
  late Tenhou tenhou;
  late Chiihou chiihou;
  late RenhouYakuman renhouYakuman;
  late Sashikomi sashikomi;
  late Paarenchan paarenchan;

  // Other
  late Dora dora;
  late AkaDora akaDora;

  yakuConfig() {
    tsumo = Tsumo(id++);
    riichi = Riichi(id++);
    openRiichi = OpenRiichi(id++);
    ippatsu = Ippatsu(id++);
    chankan = Chankan(id++);
    rinshan = Rinshan(id++);
    haitei = Haitei(id++);
    houtei = Houtei(id++);
    daburuRiichi = DaburuRiichi(id++);
    daburuOpenRiichi = DaburuOpenRiichi(id++);
    nagashiMangan = NagashiMangan(id++);
    renhou = Renhou(id++);

    pinfu = Pinfu(id++);
    tanyao = Tanyao(id++);
    iipeiko = Iipeiko(id++);
    haku = Haku(id++);
    hatsu = Hatsu(id++);
    chun = Chun(id++);

    yakuhaiEast = YakuhaiEast(id++);
    yakuhaiSouth = YakuhaiSouth(id++);
    yakuhaiWest = YakuhaiWest(id++);
    yakuhaiNorth = YakuhaiNorth(id++);
    yakuhaiOfPlace = YakuhaiOfPlace(id++);
    yakuhaiOfRound = YakuhaiOfRound(id++);
    
    sanshoku = Sanshoku(id++);
    ittsu = Ittsu(id++);
    chantai = Chantai(id++);
    honroto = Honroto(id++);
    toitoi = Toitoi(id++);
    sanankou = Sanankou(id++);
    sankantsu = SanKantsu(id++);
    sanshokuDoukou = SanshokuDoukou(id++);
    chiitoitsu = Chiitoitsu(id++);
    shosangen = Shosangen(id++);

    honitsu = Honitsu(id++);
    junchan = Junchan(id++);
    ryanpeiko = Ryanpeikou(id++);

    chinitsu = Chinitsu(id++);

    kokushiMusou = KokushiMusou(id++);
    chuurenPoutou = ChuurenPoutou(id++);
    suuankou = Suuankou(id++);
    daisangen = Daisangen(id++);
    shousuushii = Shousuushii(id++);
    ryuuiisou = Ryuuiisou(id++);
    suukantsu = Suukantsu(id++);
    tsuuiisou = Tsuuiisou(id++);
    chinroutou = Chinroutou(id++);
    daisharin = Daisharin(id++);
    daichisei = Daichisei(id++);

    daiSuushii = DaiSuushii(id++);
    daburuKokushiMusou = DaburuKokushiMusou(id++);
    suuankouTanki = SuuankouTanki(id++);
    daburuChuurenPoutou = DaburuChuurenPoutou(id++);

    tenhou = Tenhou(id++);
    chiihou = Chiihou(id++);
    renhouYakuman = RenhouYakuman(id++);
    sashikomi = Sashikomi(id++);
    paarenchan = Paarenchan(id++);

    dora = Dora(id++);
    akaDora = AkaDora(id++);
  }
}