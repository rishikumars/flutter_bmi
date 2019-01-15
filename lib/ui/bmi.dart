import 'dart:math';
import 'package:flutter/material.dart';
class Bmi extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}
class BmiState extends State<Bmi> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double _bmiResult=0.0;
  String health="";
  double percentile=0.0;
  bool isPressed=false;
  var n=[50, 50.399, 50.798, 51.197, 51.595, 51.994, 52.392, 52.79, 53.188, 53.586, 53.983, 54.38, 54.776, 55.172, 55.567, 55.962, 56.356, 56.749, 57.142, 57.535, 57.926, 58.317, 58.706, 59.095, 59.483, 59.871, 60.257, 60.642, 61.026, 61.409, 61.791, 62.172, 62.552, 62.93, 63.307, 63.683, 64.058, 64.431, 64.803, 65.173, 65.542, 65.91, 66.276, 66.64, 67.003, 67.364, 67.724, 68.082, 68.439, 68.793, 69.146, 69.497, 69.847, 70.194, 70.54, 70.884, 71.226, 71.566, 71.904, 72.24, 72.575, 72.907, 73.237, 73.565, 73.891, 74.215, 74.537, 74.857, 75.175, 75.49, 75.804, 76.115, 76.424, 76.73, 77.035, 77.337, 77.637, 77.935, 78.23, 78.524, 78.814, 79.103, 79.389, 79.673, 79.955, 80.234, 80.511, 80.785, 81.057, 81.327, 81.594, 81.859, 82.121, 82.381, 82.639, 82.894, 83.147, 83.398, 83.646, 83.891, 84.134, 84.375, 84.614, 84.849, 85.083, 85.314, 85.543, 85.769, 85.993, 86.214, 86.433, 86.65, 86.864, 87.076, 87.286, 87.493, 87.698, 87.9, 88.1, 88.298, 88.493, 88.686, 88.877, 89.065, 89.251, 89.435, 89.617, 89.796, 89.973, 90.147, 90.32, 90.49, 90.658, 90.824, 90.988, 91.149, 91.308, 91.466, 91.621, 91.774, 91.924, 92.073, 92.22, 92.364, 92.507, 92.647, 92.785, 92.922, 93.056, 93.189, 93.319, 93.448, 93.574, 93.699, 93.822, 93.943, 94.062, 94.179, 94.295, 94.408, 94.52, 94.63, 94.738, 94.845, 94.95, 95.053, 95.154, 95.254, 95.352, 95.449, 95.543, 95.637, 95.728, 95.818, 95.907, 95.994, 96.08, 96.164, 96.246, 96.327, 96.407, 96.485, 96.562, 96.638, 96.712, 96.784, 96.856, 96.926, 96.995, 97.062, 97.128, 97.193, 97.257, 97.32, 97.381, 97.441, 97.5, 97.558, 97.615, 97.67, 97.725, 97.778, 97.831, 97.882, 97.932, 97.982, 98.03, 98.077, 98.124, 98.169, 98.214, 98.257, 98.3, 98.341, 98.382, 98.422, 98.461, 98.5, 98.537, 98.574, 98.61, 98.645, 98.679, 98.713, 98.745, 98.778, 98.809, 98.84, 98.87, 98.899, 98.928, 98.956, 98.983, 99.01, 99.036, 99.061, 99.086, 99.111, 99.134, 99.158, 99.18, 99.202, 99.224, 99.245, 99.266, 99.286, 99.305, 99.324, 99.343, 99.361, 99.379, 99.396, 99.413, 99.43, 99.446, 99.461, 99.477, 99.492, 99.506, 99.52, 99.534, 99.547, 99.56, 99.573, 99.585, 99.598, 99.609, 99.621, 99.632, 99.643, 99.653, 99.664, 99.674, 99.683, 99.693, 99.702, 99.711, 99.72, 99.728, 99.736, 99.744, 99.752, 99.76, 99.767, 99.774, 99.781, 99.788, 99.795, 99.801, 99.807, 99.813, 99.819, 99.825, 99.831, 99.836, 99.841, 99.846, 99.851, 99.856, 99.861, 99.865, 99.869, 99.874, 99.878, 99.882, 99.886, 99.889, 99.893, 99.896, 99.9];
  double calPercentile(double zScore) {
    double score=zScore.abs();
    double thispercentile;
    if (zScore < -3.09) return 0.1;
    if (zScore > 3.09) return 99.9;
    thispercentile= n[(score*100).round()];
    if (zScore >= 0) { return thispercentile; }
    else { return 100 - thispercentile; }
  }

  void _calculate(int age) {
    isPressed=true;
  setState(() {
         _bmiResult = (double.parse(_weightController.text) /
          (double.parse(_heightController.text) *
              double.parse(_heightController.text)))*100;
          if(age>=21){
            if(_bmiResult<18.5)health="Under Weight";
            else if(_bmiResult>=18.5 && _bmiResult<24.9)health="Healthy Weight";
            else if(_bmiResult>25 && _bmiResult<29.9)health="Over Weight";
            else health="Obese";
          }
          else{
           int ageInMonth =  age * 12;
            double L,M,S;
            if(ageInMonth >= 24 && ageInMonth < 25){L = -1.024496827; M = 16.38804056; S = 0.085025838;}
            if(ageInMonth >= 25 && ageInMonth < 26){L = -1.102698353; M = 16.3189719; S = 0.084214052;}
            if(ageInMonth >= 26 && ageInMonth < 27){L = -1.18396635; M = 16.25207985; S = 0.083455124;}
            if(ageInMonth >= 27 && ageInMonth < 28){L = -1.268071036; M = 16.18734669; S = 0.082748284;}
            if(ageInMonth >= 28 && ageInMonth < 29){L = -1.354751525; M = 16.12475448; S = 0.082092737;}
            if(ageInMonth >= 29 && ageInMonth < 30){L = -1.443689692; M = 16.06428762; S = 0.081487717;}
            if(ageInMonth >= 30 && ageInMonth < 31){L = -1.53454192; M = 16.00593001; S = 0.080932448;}
            if(ageInMonth >= 31 && ageInMonth < 32){L = -1.626928093; M = 15.94966631; S = 0.080426175;}
            if(ageInMonth >= 32 && ageInMonth < 33){L = -1.720434829; M = 15.89548197; S = 0.079968176;}
            if(ageInMonth >= 33 && ageInMonth < 34){L = -1.814635262; M = 15.84336179; S = 0.079557735;}
            if(ageInMonth >= 34 && ageInMonth < 35){L = -1.909076262; M = 15.79329146; S = 0.079194187;}
            if(ageInMonth >= 35 && ageInMonth < 36){L = -2.003296102; M = 15.7452564; S = 0.078876895;}
            if(ageInMonth >= 36 && ageInMonth < 37){L = -2.096828937; M = 15.69924188; S = 0.078605255;}
            if(ageInMonth >= 37 && ageInMonth < 38){L = -2.189211877; M = 15.65523282; S = 0.078378696;}
            if(ageInMonth >= 38 && ageInMonth < 39){L = -2.279991982; M = 15.61321371; S = 0.078196674;}
            if(ageInMonth >= 39 && ageInMonth < 40){L = -2.368732949; M = 15.57316843; S = 0.078058667;}
            if(ageInMonth >= 40 && ageInMonth < 41){L = -2.455021314; M = 15.53508019; S = 0.077964169;}
            if(ageInMonth >= 41 && ageInMonth < 42){L = -2.538471972; M = 15.49893145; S = 0.077912684;}
            if(ageInMonth >= 42 && ageInMonth < 43){L = -2.618732901; M = 15.46470384; S = 0.077903716;}
            if(ageInMonth >= 43 && ageInMonth < 44){L = -2.695488973; M = 15.43237817; S = 0.077936763;}
            if(ageInMonth >= 44 && ageInMonth < 45){L = -2.768464816; M = 15.40193436; S = 0.078011309;}
            if(ageInMonth >= 45 && ageInMonth < 46){L = -2.837426693; M = 15.37335154; S = 0.078126817;}
            if(ageInMonth >= 46 && ageInMonth < 47){L = -2.902178205; M = 15.34660842; S = 0.078282739;}
            if(ageInMonth >= 47 && ageInMonth < 48){L = -2.962580386; M = 15.32168181; S = 0.078478449;}
            if(ageInMonth >= 48 && ageInMonth < 49){L = -3.018521987; M = 15.29854897; S = 0.078713325;}
            if(ageInMonth >= 49 && ageInMonth < 50){L = -3.069936555; M = 15.27718618; S = 0.078986694;}
            if(ageInMonth >= 50 && ageInMonth < 51){L = -3.116795864; M = 15.2575692; S = 0.079297841;}
            if(ageInMonth >= 51 && ageInMonth < 52){L = -3.159107331; M = 15.23967338; S = 0.079646006;}
            if(ageInMonth >= 52 && ageInMonth < 53){L = -3.196911083; M = 15.22347371; S = 0.080030389;}
            if(ageInMonth >= 53 && ageInMonth < 54){L = -3.230276759; M = 15.20894491; S = 0.080450145;}
            if(ageInMonth >= 54 && ageInMonth < 55){L = -3.259300182; M = 15.19606152; S = 0.080904391;}
            if(ageInMonth >= 55 && ageInMonth < 56){L = -3.284099963; M = 15.18479799; S = 0.081392203;}
            if(ageInMonth >= 56 && ageInMonth < 57){L = -3.30481415; M = 15.17512871; S = 0.081912623;}
            if(ageInMonth >= 57 && ageInMonth < 58){L = -3.321596954; M = 15.16702811; S = 0.082464661;}
            if(ageInMonth >= 58 && ageInMonth < 59){L = -3.334615646; M = 15.16047068; S = 0.083047295;}
            if(ageInMonth >= 59 && ageInMonth < 60){L = -3.344047622; M = 15.15543107; S = 0.083659478;}
            if(ageInMonth >= 60 && ageInMonth < 61){L = -3.35007771; M = 15.15188405; S = 0.084300139;}
            if(ageInMonth >= 61 && ageInMonth < 62){L = -3.352893805; M = 15.14980479; S = 0.0849682;}
            if(ageInMonth >= 62 && ageInMonth < 63){L = -3.352691376; M = 15.14916825; S = 0.085662539;}
            if(ageInMonth >= 63 && ageInMonth < 64){L = -3.34966438; M = 15.14994984; S = 0.086382035;}
            if(ageInMonth >= 64 && ageInMonth < 65){L = -3.343998803; M = 15.15212585; S = 0.087125591;}
            if(ageInMonth >= 65 && ageInMonth < 66){L = -3.335889574; M = 15.15567186; S = 0.087892047;}
            if(ageInMonth >= 66 && ageInMonth < 67){L = -3.325522491; M = 15.16056419; S = 0.088680264;}
            if(ageInMonth >= 67 && ageInMonth < 68){L = -3.31307846; M = 15.16677947; S = 0.089489106;}
            if(ageInMonth >= 68 && ageInMonth < 69){L = -3.298732648; M = 15.17429464; S = 0.090317434;}
            if(ageInMonth >= 69 && ageInMonth < 70){L = -3.282653831; M = 15.18308694; S = 0.091164117;}
            if(ageInMonth >= 70 && ageInMonth < 71){L = -3.265003896; M = 15.1931339; S = 0.092028028;}
            if(ageInMonth >= 71 && ageInMonth < 72){L = -3.245937506; M = 15.20441335; S = 0.092908048;}
            if(ageInMonth >= 72 && ageInMonth < 73){L = -3.225606516; M = 15.21690296; S = 0.093803033;}
            if(ageInMonth >= 73 && ageInMonth < 74){L = -3.204146115; M = 15.2305815; S = 0.094711916;}
            if(ageInMonth >= 74 && ageInMonth < 75){L = -3.181690237; M = 15.24542745; S = 0.095633595;}
            if(ageInMonth >= 75 && ageInMonth < 76){L = -3.158363475; M = 15.26141966; S = 0.096566992;}
            if(ageInMonth >= 76 && ageInMonth < 77){L = -3.134282833; M = 15.27853728; S = 0.097511046;}
            if(ageInMonth >= 77 && ageInMonth < 78){L = -3.109557879; M = 15.29675967; S = 0.09846471;}
            if(ageInMonth >= 78 && ageInMonth < 79){L = -3.084290931; M = 15.31606644; S = 0.099426955;}
            if(ageInMonth >= 79 && ageInMonth < 80){L = -3.058577292; M = 15.33643745; S = 0.100396769;}
            if(ageInMonth >= 80 && ageInMonth < 81){L = -3.032505499; M = 15.35785274; S = 0.101373159;}
            if(ageInMonth >= 81 && ageInMonth < 82){L = -3.0061576; M = 15.38029261; S = 0.10235515;}
            if(ageInMonth >= 82 && ageInMonth < 83){L = -2.979609448; M = 15.40373754; S = 0.103341788;}
            if(ageInMonth >= 83 && ageInMonth < 84){L = -2.952930993; M = 15.42816819; S = 0.104332139;}
            if(ageInMonth >= 84 && ageInMonth < 85){L = -2.926186592; M = 15.45356545; S = 0.105325289;}
            if(ageInMonth >= 85 && ageInMonth < 86){L = -2.899435307; M = 15.47991037; S = 0.106320346;}
            if(ageInMonth >= 86 && ageInMonth < 87){L = -2.872731211; M = 15.50718419; S = 0.10731644;}
            if(ageInMonth >= 87 && ageInMonth < 88){L = -2.846123683; M = 15.53536829; S = 0.108312721;}
            if(ageInMonth >= 88 && ageInMonth < 89){L = -2.819657704; M = 15.56444426; S = 0.109308364;}
            if(ageInMonth >= 89 && ageInMonth < 90){L = -2.793374145; M = 15.5943938; S = 0.110302563;}
            if(ageInMonth >= 90 && ageInMonth < 91){L = -2.767310047; M = 15.6251988; S = 0.111294537;}
            if(ageInMonth >= 91 && ageInMonth < 92){L = -2.741498897; M = 15.65684126; S = 0.112283526;}
            if(ageInMonth >= 92 && ageInMonth < 93){L = -2.715970894; M = 15.68930333; S = 0.113268793;}
            if(ageInMonth >= 93 && ageInMonth < 94){L = -2.690753197; M = 15.7225673; S = 0.114249622;}
            if(ageInMonth >= 94 && ageInMonth < 95){L = -2.665870146; M = 15.75661555; S = 0.115225321;}
            if(ageInMonth >= 95 && ageInMonth < 96){L = -2.641343436; M = 15.79143062; S = 0.116195218;}
            if(ageInMonth >= 96 && ageInMonth < 97){L = -2.617192204; M = 15.82699517; S = 0.117158667;}
            if(ageInMonth >= 97 && ageInMonth < 98){L = -2.593430614; M = 15.86329241; S = 0.118115073;}
            if(ageInMonth >= 98 && ageInMonth < 99){L = -2.570076037; M = 15.90030484; S = 0.119063807;}
            if(ageInMonth >= 99 && ageInMonth < 100){L = -2.547141473; M = 15.93801545; S = 0.12000429;}
            if(ageInMonth >= 100 && ageInMonth < 101){L = -2.524635245; M = 15.97640787; S = 0.120935994;}
            if(ageInMonth >= 101 && ageInMonth < 102){L = -2.502569666; M = 16.01546483; S = 0.121858355;}
            if(ageInMonth >= 102 && ageInMonth < 103){L = -2.48095189; M = 16.05516984; S = 0.12277087;}
            if(ageInMonth >= 103 && ageInMonth < 104){L = -2.459785573; M = 16.09550688; S = 0.123673085;}
            if(ageInMonth >= 104 && ageInMonth < 105){L = -2.439080117; M = 16.13645881; S = 0.124564484;}
            if(ageInMonth >= 105 && ageInMonth < 106){L = -2.418838304; M = 16.17800955; S = 0.125444639;}
            if(ageInMonth >= 106 && ageInMonth < 107){L = -2.399063683; M = 16.22014281; S = 0.126313121;}
            if(ageInMonth >= 107 && ageInMonth < 108){L = -2.379756861; M = 16.26284277; S = 0.127169545;}
            if(ageInMonth >= 108 && ageInMonth < 109){L = -2.360920527; M = 16.30609316; S = 0.128013515;}
            if(ageInMonth >= 109 && ageInMonth < 110){L = -2.342557728; M = 16.34987759; S = 0.128844639;}
            if(ageInMonth >= 110 && ageInMonth < 111){L = -2.324663326; M = 16.39418118; S = 0.129662637;}
            if(ageInMonth >= 111 && ageInMonth < 112){L = -2.307240716; M = 16.43898741; S = 0.130467138;}
            if(ageInMonth >= 112 && ageInMonth < 113){L = -2.290287663; M = 16.48428082; S = 0.131257852;}
            if(ageInMonth >= 113 && ageInMonth < 114){L = -2.273803847; M = 16.53004554; S = 0.132034479;}
            if(ageInMonth >= 114 && ageInMonth < 115){L = -2.257782149; M = 16.57626713; S = 0.132796819;}
            if(ageInMonth >= 115 && ageInMonth < 116){L = -2.242227723; M = 16.62292864; S = 0.133544525;}
            if(ageInMonth >= 116 && ageInMonth < 117){L = -2.227132805; M = 16.67001572; S = 0.134277436;}
            if(ageInMonth >= 117 && ageInMonth < 118){L = -2.212495585; M = 16.71751288; S = 0.134995324;}
            if(ageInMonth >= 118 && ageInMonth < 119){L = -2.19831275; M = 16.76540496; S = 0.135697996;}
            if(ageInMonth >= 119 && ageInMonth < 120){L = -2.184580762; M = 16.81367689; S = 0.136385276;}
            if(ageInMonth >= 120 && ageInMonth < 121){L = -2.171295888; M = 16.86231366; S = 0.137057004;}
            if(ageInMonth >= 121 && ageInMonth < 122){L = -2.158454232; M = 16.91130036; S = 0.137713039;}
            if(ageInMonth >= 122 && ageInMonth < 123){L = -2.146051754; M = 16.96062216; S = 0.138353254;}
            if(ageInMonth >= 123 && ageInMonth < 124){L = -2.134084303; M = 17.0102643; S = 0.138977537;}
            if(ageInMonth >= 124 && ageInMonth < 125){L = -2.122547629; M = 17.06021213; S = 0.139585795;}
            if(ageInMonth >= 125 && ageInMonth < 126){L = -2.111437411; M = 17.11045106; S = 0.140177947;}
            if(ageInMonth >= 126 && ageInMonth < 127){L = -2.100749266; M = 17.16096656; S = 0.140753927;}
            if(ageInMonth >= 127 && ageInMonth < 128){L = -2.090478774; M = 17.21174424; S = 0.141313686;}
            if(ageInMonth >= 128 && ageInMonth < 129){L = -2.080621484; M = 17.26276973; S = 0.141857186;}
            if(ageInMonth >= 129 && ageInMonth < 130){L = -2.071172932; M = 17.31402878; S = 0.142384404;}
            if(ageInMonth >= 130 && ageInMonth < 131){L = -2.062128649; M = 17.3655072; S = 0.142895332;}
            if(ageInMonth >= 131 && ageInMonth < 132){L = -2.053484173; M = 17.4171909; S = 0.143389972;}
            if(ageInMonth >= 132 && ageInMonth < 133){L = -2.045235058; M = 17.46906585; S = 0.143868341;}
            if(ageInMonth >= 133 && ageInMonth < 134){L = -2.03737688; M = 17.52111811; S = 0.144330469;}
            if(ageInMonth >= 134 && ageInMonth < 135){L = -2.029906684; M = 17.57333347; S = 0.144776372;}
            if(ageInMonth >= 135 && ageInMonth < 136){L = -2.022817914; M = 17.62569869; S = 0.145206138;}
            if(ageInMonth >= 136 && ageInMonth < 137){L = -2.016107084; M = 17.67819987; S = 0.145619819;}
            if(ageInMonth >= 137 && ageInMonth < 138){L = -2.009769905; M = 17.7308234; S = 0.146017491;}
            if(ageInMonth >= 138 && ageInMonth < 139){L = -2.003802134; M = 17.78355575; S = 0.146399239;}
            if(ageInMonth >= 139 && ageInMonth < 140){L = -1.998199572; M = 17.83638347; S = 0.146765161;}
            if(ageInMonth >= 140 && ageInMonth < 141){L = -1.992958064; M = 17.88929321; S = 0.147115364;}
            if(ageInMonth >= 141 && ageInMonth < 142){L = -1.988073505; M = 17.94227168; S = 0.147449967;}
            if(ageInMonth >= 142 && ageInMonth < 143){L = -1.983541835; M = 17.9953057; S = 0.147769097;}
            if(ageInMonth >= 143 && ageInMonth < 144){L = -1.979359041; M = 18.04838216; S = 0.148072891;}
            if(ageInMonth >= 144 && ageInMonth < 145){L = -1.975521156; M = 18.10148804; S = 0.148361495;}
            if(ageInMonth >= 145 && ageInMonth < 146){L = -1.972024258; M = 18.15461039; S = 0.148635067;}
            if(ageInMonth >= 146 && ageInMonth < 147){L = -1.968864465; M = 18.20773639; S = 0.148893769;}
            if(ageInMonth >= 147 && ageInMonth < 148){L = -1.966037938; M = 18.26085325; S = 0.149137776;}
            if(ageInMonth >= 148 && ageInMonth < 149){L = -1.963540872; M = 18.31394832; S = 0.14936727;}
            if(ageInMonth >= 149 && ageInMonth < 150){L = -1.961369499; M = 18.36700902; S = 0.149582439;}
            if(ageInMonth >= 150 && ageInMonth < 151){L = -1.959520079; M = 18.42002284; S = 0.149783482;}
            if(ageInMonth >= 151 && ageInMonth < 152){L = -1.9579889; M = 18.47297739; S = 0.149970604;}
            if(ageInMonth >= 152 && ageInMonth < 153){L = -1.956772271; M = 18.52586035; S = 0.15014402;}
            if(ageInMonth >= 153 && ageInMonth < 154){L = -1.95586652; M = 18.57865951; S = 0.15030395;}
            if(ageInMonth >= 154 && ageInMonth < 155){L = -1.955267984; M = 18.63136275; S = 0.150450621;}
            if(ageInMonth >= 155 && ageInMonth < 156){L = -1.954973011; M = 18.68395801; S = 0.15058427;}
            if(ageInMonth >= 156 && ageInMonth < 157){L = -1.954977947; M = 18.73643338; S = 0.150705138;}
            if(ageInMonth >= 157 && ageInMonth < 158){L = -1.955279136; M = 18.788777; S = 0.150813475;}
            if(ageInMonth >= 158 && ageInMonth < 159){L = -1.955872909; M = 18.84097713; S = 0.150909535;}
            if(ageInMonth >= 159 && ageInMonth < 160){L = -1.956755579; M = 18.89302212; S = 0.150993582;}
            if(ageInMonth >= 160 && ageInMonth < 161){L = -1.957923436; M = 18.94490041; S = 0.151065883;}
            if(ageInMonth >= 161 && ageInMonth < 162){L = -1.959372737; M = 18.99660055; S = 0.151126714;}
            if(ageInMonth >= 162 && ageInMonth < 163){L = -1.9610997; M = 19.04811118; S = 0.151176355;}
            if(ageInMonth >= 163 && ageInMonth < 164){L = -1.963100496; M = 19.09942105; S = 0.151215094;}
            if(ageInMonth >= 164 && ageInMonth < 165){L = -1.96537124; M = 19.15051899; S = 0.151243223;}
            if(ageInMonth >= 165 && ageInMonth < 166){L = -1.967907983; M = 19.20139397; S = 0.151261042;}
            if(ageInMonth >= 166 && ageInMonth < 167){L = -1.970706706; M = 19.25203503; S = 0.151268855;}
            if(ageInMonth >= 167 && ageInMonth < 168){L = -1.973763307; M = 19.30243131; S = 0.151266974;}
            if(ageInMonth >= 168 && ageInMonth < 169){L = -1.977073595; M = 19.35257209; S = 0.151255713;}
            if(ageInMonth >= 169 && ageInMonth < 170){L = -1.980633277; M = 19.40244671; S = 0.151235395;}
            if(ageInMonth >= 170 && ageInMonth < 171){L = -1.984437954; M = 19.45204465; S = 0.151206347;}
            if(ageInMonth >= 171 && ageInMonth < 172){L = -1.988483106; M = 19.50135548; S = 0.151168902;}
            if(ageInMonth >= 172 && ageInMonth < 173){L = -1.992764085; M = 19.55036888; S = 0.151123398;}
            if(ageInMonth >= 173 && ageInMonth < 174){L = -1.997276103; M = 19.59907464; S = 0.15107018;}
            if(ageInMonth >= 174 && ageInMonth < 175){L = -2.002014224; M = 19.64746266; S = 0.151009595;}
            if(ageInMonth >= 175 && ageInMonth < 176){L = -2.00697335; M = 19.69552294; S = 0.150942;}
            if(ageInMonth >= 176 && ageInMonth < 177){L = -2.012148213; M = 19.7432456; S = 0.150867753;}
            if(ageInMonth >= 177 && ageInMonth < 178){L = -2.017533363; M = 19.79062086; S = 0.150787221;}
            if(ageInMonth >= 178 && ageInMonth < 179){L = -2.023123159; M = 19.83763907; S = 0.150700774;}
            if(ageInMonth >= 179 && ageInMonth < 180){L = -2.028911755; M = 19.88429066; S = 0.150608788;}
            if(ageInMonth >= 180 && ageInMonth < 181){L = -2.034893091; M = 19.9305662; S = 0.150511645;}
            if(ageInMonth >= 181 && ageInMonth < 182){L = -2.041060881; M = 19.97645636; S = 0.150409731;}
            if(ageInMonth >= 182 && ageInMonth < 183){L = -2.047408604; M = 20.02195192; S = 0.15030344;}
            if(ageInMonth >= 183 && ageInMonth < 184){L = -2.05392949; M = 20.06704377; S = 0.150193169;}
            if(ageInMonth >= 184 && ageInMonth < 185){L = -2.060616513; M = 20.11172291; S = 0.150079322;}
            if(ageInMonth >= 185 && ageInMonth < 186){L = -2.067462375; M = 20.15598047; S = 0.149962308;}
            if(ageInMonth >= 186 && ageInMonth < 187){L = -2.074459502; M = 20.19980767; S = 0.14984254;}
            if(ageInMonth >= 187 && ageInMonth < 188){L = -2.081600029; M = 20.24319586; S = 0.149720441;}
            if(ageInMonth >= 188 && ageInMonth < 189){L = -2.088875793; M = 20.28613648; S = 0.149596434;}
            if(ageInMonth >= 189 && ageInMonth < 190){L = -2.096278323; M = 20.32862109; S = 0.149470953;}
            if(ageInMonth >= 190 && ageInMonth < 191){L = -2.103798828; M = 20.37064138; S = 0.149344433;}
            if(ageInMonth >= 191 && ageInMonth < 192){L = -2.111428194; M = 20.41218911; S = 0.149217319;}
            if(ageInMonth >= 192 && ageInMonth < 193){L = -2.119156972; M = 20.45325617; S = 0.14909006;}
            if(ageInMonth >= 193 && ageInMonth < 194){L = -2.126975375; M = 20.49383457; S = 0.14896311;}
            if(ageInMonth >= 194 && ageInMonth < 195){L = -2.134873266; M = 20.5339164; S = 0.148836931;}
            if(ageInMonth >= 195 && ageInMonth < 196){L = -2.142840157; M = 20.57349387; S = 0.148711989;}
            if(ageInMonth >= 196 && ageInMonth < 197){L = -2.150865204; M = 20.61255929; S = 0.148588757;}
            if(ageInMonth >= 197 && ageInMonth < 198){L = -2.158937201; M = 20.65110506; S = 0.148467715;}
            if(ageInMonth >= 198 && ageInMonth < 199){L = -2.167044578; M = 20.6891237; S = 0.148349348;}
            if(ageInMonth >= 199 && ageInMonth < 200){L = -2.175176987; M = 20.72660728; S = 0.14823412;}
            if(ageInMonth >= 200 && ageInMonth < 201){L = -2.183317362; M = 20.76355011; S = 0.148122614;}
            if(ageInMonth >= 201 && ageInMonth < 202){L = -2.191457792; M = 20.79994337; S = 0.148015249;}
            if(ageInMonth >= 202 && ageInMonth < 203){L = -2.199583649; M = 20.83578051; S = 0.147912564;}
            if(ageInMonth >= 203 && ageInMonth < 204){L = -2.207681525; M = 20.87105449; S = 0.147815078;}
            if(ageInMonth >= 204 && ageInMonth < 205){L = -2.215737645; M = 20.90575839; S = 0.147723315;}
            if(ageInMonth >= 205 && ageInMonth < 206){L = -2.223739902; M = 20.93988477; S = 0.147637768;}
            if(ageInMonth >= 206 && ageInMonth < 207){L = -2.231667995; M = 20.97342858; S = 0.147559083;}
            if(ageInMonth >= 207 && ageInMonth < 208){L = -2.239511942; M = 21.00638171; S = 0.147487716;}
            if(ageInMonth >= 208 && ageInMonth < 209){L = -2.247257081; M = 21.0387374; S = 0.14742421;}
            if(ageInMonth >= 209 && ageInMonth < 210){L = -2.254885145; M = 21.07048996; S = 0.147369174;}
            if(ageInMonth >= 210 && ageInMonth < 211){L = -2.26238209; M = 21.10163241; S = 0.147323144;}
            if(ageInMonth >= 211 && ageInMonth < 212){L = -2.269731517; M = 21.13215845; S = 0.147286698;}
            if(ageInMonth >= 212 && ageInMonth < 213){L = -2.276917229; M = 21.16206171; S = 0.147260415;}
            if(ageInMonth >= 213 && ageInMonth < 214){L = -2.283925442; M = 21.1913351; S = 0.147244828;}
            if(ageInMonth >= 214 && ageInMonth < 215){L = -2.290731442; M = 21.21997472; S = 0.147240683;}
            if(ageInMonth >= 215 && ageInMonth < 216){L = -2.29732427; M = 21.24797262; S = 0.147248467;}
            if(ageInMonth >= 216 && ageInMonth < 217){L = -2.303687802; M = 21.27532239; S = 0.14726877;}
            if(ageInMonth >= 217 && ageInMonth < 218){L = -2.309799971; M = 21.30201933; S = 0.147302299;}
            if(ageInMonth >= 218 && ageInMonth < 219){L = -2.315651874; M = 21.32805489; S = 0.147349514;}
            if(ageInMonth >= 219 && ageInMonth < 220){L = -2.32121731; M = 21.35342563; S = 0.147411215;}
            if(ageInMonth >= 220 && ageInMonth < 221){L = -2.326481911; M = 21.37812462; S = 0.147487979;}
            if(ageInMonth >= 221 && ageInMonth < 222){L = -2.331428139; M = 21.40214589; S = 0.147580453;}
            if(ageInMonth >= 222 && ageInMonth < 223){L = -2.336038473; M = 21.42548351; S = 0.147689289;}
            if(ageInMonth >= 223 && ageInMonth < 224){L = -2.34029545; M = 21.44813156; S = 0.14781515;}
            if(ageInMonth >= 224 && ageInMonth < 225){L = -2.344181703; M = 21.47008412; S = 0.147958706;}
            if(ageInMonth >= 225 && ageInMonth < 226){L = -2.34768; M = 21.49133529; S = 0.148120633;}
            if(ageInMonth >= 226 && ageInMonth < 227){L = -2.350773286; M = 21.51187918; S = 0.148301619;}
            if(ageInMonth >= 227 && ageInMonth < 228){L = -2.353444725; M = 21.53170989; S = 0.148502355;}
            if(ageInMonth >= 228 && ageInMonth < 229){L = -2.355677743; M = 21.55082155; S = 0.148723546;}
            if(ageInMonth >= 229 && ageInMonth < 230){L = -2.35745607; M = 21.56920824; S = 0.148965902;}
            if(ageInMonth >= 230 && ageInMonth < 231){L = -2.358763788; M = 21.58686406; S = 0.149230142;}
            if(ageInMonth >= 231 && ageInMonth < 232){L = -2.359585369; M = 21.60378309; S = 0.149516994;}
            if(ageInMonth >= 232 && ageInMonth < 233){L = -2.359905726; M = 21.61995939; S = 0.149827195;}
            if(ageInMonth >= 233 && ageInMonth < 234){L = -2.359710258; M = 21.635387; S = 0.150161492;}
            if(ageInMonth >= 234 && ageInMonth < 235){L = -2.358980464; M = 21.65006126; S = 0.150520734;}
            if(ageInMonth >= 235 && ageInMonth < 236){L = -2.357714508; M = 21.6639727; S = 0.150905439;}
            if(ageInMonth >= 236 && ageInMonth < 237){L = -2.355892424; M = 21.67711736; S = 0.151316531;}
            if(ageInMonth >= 237 && ageInMonth < 238){L = -2.353501353; M = 21.68948935; S = 0.151754808;}
            if(ageInMonth >= 238 && ageInMonth < 239){L = -2.350528726; M = 21.70108288; S = 0.152221086;}
            if(ageInMonth >= 239 && ageInMonth < 240){L = -2.346962247; M = 21.71189225; S = 0.152716206;}
            if(ageInMonth >= 240 && ageInMonth < 241){L = -2.342796948; M = 21.72190973; S = 0.153240872;}
            double zScore=(pow(_bmiResult/M,L)-1)/(L*S);
            percentile=calPercentile(zScore);
            if(percentile<5)health="Under Weight";
            else if(percentile>=5&&percentile<85)health="Healthy Weight";
            else if(percentile>=85&&percentile<95)health="Over Weight";
            else health="obese";
          }
  }
  );
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.pinkAccent,
        title: new Text("BMI",
          style: new TextStyle(color: Colors.white, fontSize: 25,),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset("images/bmi.png",
              width: 280.0,
              height: 170.0,),
            new Container(
              padding: EdgeInsets.all(15.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(icon: new Icon(Icons.person),
                        labelText: "Your age",
                        labelStyle: TextStyle(fontSize: 20.0)),
                  ),
                  new Padding(padding: EdgeInsets.only(top: 8.0)),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(icon: new Icon(Icons.wc),
                        labelText: "Your height in meters",
                        labelStyle: TextStyle(fontSize: 20.0)),
                  ),
                  new Padding(padding: EdgeInsets.only(top: 8.0)),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(icon: new Icon(Icons.view_day),
                        labelText: "Your weight in KG",
                        labelStyle: TextStyle(fontSize: 20.0)),
                  ),
                  new Padding(padding: EdgeInsets.all(10.0)),
                  new RaisedButton(onPressed: () => _calculate(int.parse(_ageController.text)),
                    color: Colors.pinkAccent,
                    padding: EdgeInsets.all(15.0),
                    child: new Text("Calculate",
                      style: new TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Container(
              alignment: Alignment.center,
              child:showContent(),
            )
          ],
        ),
      ),
    );
  }
  showContent() {
    if(isPressed) {
      return new Column(
        children: <Widget>[

          new Text("Your BMI: ${_bmiResult.toStringAsFixed(1)}",
            style: TextStyle(color: Colors.blue,
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic),),
          new Text("$health",
            style: TextStyle(color: Colors.pinkAccent,
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic),),
        ],
      );
    }
  }
}