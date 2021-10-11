
import 'package:flutter_radixweb/constant/size_config.dart';

class AppFontSize {
  static double large = 32;
  static double h1 = 22;
  static double h2 = 20;
  static double h3 = 18;
  static double h4 = 16;
  static double h5 = 14;
  static double h6 = 12;

  // Padding Margin values
  static double value0_8 = 0.8;
  static double value0 = 0;
  static double value1 = 1;
  static double value2 = 2;
  static double value3 = 3;
  static double value4 = 4;
  static double value5 = 5;
  static double value6 = 6;
  static double value7 = 7;
  static double value8 = 8;
  static double value9 = 9;
  static double value10 = 10;
  static double value11 = 11;
  static double value12 = 12;
  static double value12_5 = 12.5;
  static double value13 = 13;
  static double value14 = 14;
  static double value15 = 15;
  static double value16 = 16;
  static double value18 = 18;
  static double value19 = 19;
  static double value20 = 20;
  static double value21 = 21;
  static double value22 = 22;
  static double value24 = 24;
  static double value25 = 25;
  static double value26 = 26;
  static double value27 = 27;
  static double value28 = 28;
  static double value30 = 30;
  static double value32 = 32;
  static double value33 = 33;
  static double value34 = 34;
  static double value35 = 35;
  static double value36 = 36;
  static double value38 = 38;
  static double value40 = 40;
  static double value44 = 44;
  static double value45 = 45;
  static double value46 = 46;
  static double value48 = 48;
  static double value49 = 49;
  static double value50 = 50;
  static double value55 = 55;
  static double value56 = 56;
  static double value58 = 58;
  static double value60 = 60;
  static double value62 = 62;
  static double value65 = 65;
  static double value69 = 69;
  static double value70 = 70;
  static double value79 = 79;
  static double value80 = 80;
  static double value86 = 86;
  static double value88 = 88;
  static double value90 = 90;
  static double value92 = 92;
  static double value96 = 96;
  static double value100 = 100;
  static double value105 = 105;
  static double value110 = 110;
  static double value118 = 118;
  static double value120 = 120;
  static double value125 = 125;
  static double value130 = 130;
  static double value140 = 140;
  static double value144 = 144;
  static double value145 = 145;
  static double value150 = 150;
  static double value160 = 160;
  static double value170 = 170;
  static double value182 = 182;
  static double value186 = 186;
  static double value190 = 190;
  static double value205 = 205;
  static double value206 = 206;
  static double value208 = 208;
  static double value227 = 227;
  static double value300 = 300;
  static double value330 = 330;
  static double value340 = 340;
  static double value500 = 500;
  static double value2000 = 2000;

  static double toolbarHeight = 48;

  static int maxImageSelection = 50;
  static int maxVideoSelection = 15;
  static double maxVideoSize = 200.0;

  static void init() {
    large = SizeConfig.isTabletDevice ? 48 : 32;
    h1 = SizeConfig.isTabletDevice ? 33 : 22;
    h2 = SizeConfig.isTabletDevice ? 30 : 20;
    h3 = SizeConfig.isTabletDevice ? 27 : 18;
    h4 = SizeConfig.isTabletDevice ? 24 : 16;
    h5 = SizeConfig.isTabletDevice ? 21 : 14;
    h6 = SizeConfig.isTabletDevice ? 18 : 12;

    value4 = SizeConfig.isTabletDevice ? 6 : 4;
    value6 = SizeConfig.isTabletDevice ? 9 : 6;
    value8 = SizeConfig.isTabletDevice ? 12 : 8;
    value10 = SizeConfig.isTabletDevice ? 15 : 10;
    value12 = SizeConfig.isTabletDevice ? 18 : 12;
    value16 = SizeConfig.isTabletDevice ? 24 : 16;
    value18 = SizeConfig.isTabletDevice ? 27 : 18;
    value20 = SizeConfig.isTabletDevice ? 30 : 20;
    value22 = SizeConfig.isTabletDevice ? 33 : 22;
    value24 = SizeConfig.isTabletDevice ? 36 : 24;
    value26 = SizeConfig.isTabletDevice ? 39 : 26;
    value28 = SizeConfig.isTabletDevice ? 42 : 28;
    value30 = SizeConfig.isTabletDevice ? 45 : 30;

    toolbarHeight = SizeConfig.isTabletDevice ? 84 : 48;
  }
}
