import 'dart:ui';

Color accentColor = "#23408F".toColor();
Color borderColor = "#DEDEDE".toColor();
Color greyColor = "#9B9B9B".toColor();
Color greyScaleColor = "#F7F7F7".toColor();
Color subtextColor = "#6E758A".toColor();
Color bottomSahdowColor = "#1F23408F".toColor();
Color lightAccent = "#E5ECFF".toColor();
Color yellowColor = "#FFC403".toColor();
Color darkgrey = "#CFCFCF".toColor();
Color jetColor = '#292929'.toColor();
Color greenColor = "#58B15C".toColor();
Color textFiledBorder = "#B3B3B3".toColor();
Color chatbgColor = '#7D7D7D'.toColor();
Color textborder = "#DFDFDF".toColor();

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
