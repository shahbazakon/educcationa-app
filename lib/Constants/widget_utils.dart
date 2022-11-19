import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'color_data.dart';
import 'constant.dart';

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget getAssetImage(String image,
    {double? width, double? height, Color? color, BoxFit boxFit = BoxFit.contain}) {
  return Image.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

initializeScreenSize(BuildContext context, {double width = 414, double height = 896}) {
  ScreenUtil.init(context, designSize: Size(width, height), minTextAdapt: true);
}

getColorStatusBar(Color? color) {
  return AppBar(
    backgroundColor: color,
    toolbarHeight: 0,
    elevation: 0,
    systemOverlayStyle:
        SystemUiOverlayStyle(systemNavigationBarColor: color, statusBarColor: color),
  );
}

Widget getSvgImage(String image,
    {double? width, double? height, Color? color, BoxFit boxFit = BoxFit.contain}) {
  return SvgPicture.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getPaddingWidget(EdgeInsets edgeInsets, Widget widget) {
  return Padding(
    padding: edgeInsets,
    child: widget,
  );
}

Widget getCustomFont(String text, double fontSize, Color fontColor, int maxLine,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    maxLines: maxLine,
    softWrap: true,
    textAlign: textAlign,
  );
}

Widget getMultilineCustomFont(String text, double fontSize, Color fontColor,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight = 1.0}) {
  return Text(
    text,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    textAlign: textAlign,
  );
}

BoxDecoration getButtonDecoration(Color bgColor,
    {BorderRadius? borderRadius,
    Border? border,
    List<BoxShadow> shadow = const [],
    DecorationImage? image}) {
  return BoxDecoration(
      color: bgColor, borderRadius: borderRadius, border: border, boxShadow: shadow, image: image);
}

setStatusBarColor(Color color) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: color));
}

Widget getDivider(Color color, double thickness) {
  return Divider(
    color: color,
    thickness: thickness,
  );
}

Widget getButton(BuildContext context, Color bgColor, String text, Color textColor,
    Function function, double fontsize,
    {bool isBorder = false,
    EdgeInsetsGeometry? insetsGeometry,
    borderColor = Colors.transparent,
    FontWeight weight = FontWeight.bold,
    bool isIcon = false,
    String? image,
    Color? imageColor,
    double? imageWidth,
    double? imageHeight,
    bool smallFont = false,
    double? buttonHeight,
    double? buttonWidth,
    List<BoxShadow> boxShadow = const [],
    EdgeInsetsGeometry? insetsGeometrypadding,
    BorderRadius? borderRadius,
    double? borderWidth}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      margin: insetsGeometry,
      padding: insetsGeometrypadding,
      width: buttonWidth,
      height: buttonHeight,
      decoration: getButtonDecoration(
        bgColor,
        borderRadius: borderRadius,
        shadow: boxShadow,
        border: (isBorder) ? Border.all(color: borderColor, width: borderWidth!) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (isIcon) ? getSvgImage(image!) : getHorSpace(0),
          (isIcon) ? getHorSpace(15.h) : getHorSpace(0),
          getCustomFont(text, fontsize, textColor, 1,
              textAlign: TextAlign.center, fontWeight: weight, fontFamily: Constant.fontsFamily)
        ],
      ),
    ),
  );
}

Widget getHorSpace(double verSpace) {
  return SizedBox(
    width: verSpace,
  );
}

Widget getDefaultTextFiledWithLabel(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withSufix = false,
    bool minLines = false,
    bool isPass = false,
    bool isEnable = true,
    bool isprefix = false,
    Widget? prefix,
    double? height,
    String? suffiximage,
    Function? imagefunction,
    List<TextInputFormatter>? inputFormatters,
    FormFieldValidator<String>? validator,
    BoxConstraints? constraint,
    ValueChanged<String>? onChanged,
    double vertical = 20,
    double horizontal = 20,
    int? length,
    String obscuringCharacter = '•',
    GestureTapCallback? onTap,
    bool isReadonly = false,
    TextInputType? keyboardType}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return TextFormField(
        readOnly: isReadonly,
        onTap: onTap,
        onChanged: onChanged,
        validator: validator,
        enabled: true,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLines: (minLines) ? null : 1,
        controller: textEditingController,
        obscuringCharacter: obscuringCharacter,
        autofocus: false,
        obscureText: isPass,
        showCursor: true,
        cursorColor: accentColor,
        maxLength: length,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 15.sp,
            fontFamily: Constant.fontsFamily),
        decoration: InputDecoration(
            counterText: "",
            contentPadding: EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.h),
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: borderColor, width: 1.h)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: accentColor, width: 1.h)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: borderColor, width: 1.h)),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 24.h,
            ),
            suffixIcon: withSufix == true
                ? GestureDetector(
                    onTap: () {
                      imagefunction;
                    },
                    child: getPaddingWidget(
                      EdgeInsets.only(right: 18.h),
                      getSvgImage(suffiximage.toString(), width: 20.h, height: 20.h),
                    ))
                : null,
            prefixIconConstraints: constraint,
            prefixIcon: isprefix == true ? prefix : null,
            hintText: s,
            hintStyle: TextStyle(
                color: greyColor,
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
                fontFamily: Constant.fontsFamily)),
      );
    },
  );
}

Widget getMultiLineTextField(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withSufix = false,
    bool minLines = false,
    bool isPass = false,
    bool isEnable = true,
    bool isprefix = false,
    Widget? prefix,
    double? height,
    String? suffiximage,
    Function? imagefunction,
    List<TextInputFormatter>? inputFormatters,
    FormFieldValidator<String>? validator,
    BoxConstraints? constraint,
    ValueChanged<String>? onChanged,
    double vertical = 20,
    double horizontal = 20,
    int? length,
    String obscuringCharacter = '•',
    GestureTapCallback? onTap,
    bool isReadonly = false,
    TextInputType? keyboardType}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return TextFormField(
        readOnly: isReadonly,
        onTap: onTap,
        onChanged: onChanged,
        validator: validator,
        enabled: true,
        keyboardType: TextInputType.multiline,
        inputFormatters: inputFormatters,
        maxLines: 5,
        controller: textEditingController,
        obscuringCharacter: obscuringCharacter,
        autofocus: false,
        obscureText: isPass,
        showCursor: true,
        cursorColor: accentColor,
        maxLength: length,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            fontFamily: Constant.fontsFamily),
        decoration: InputDecoration(
            counterText: "",
            contentPadding: EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.h),
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: textborder, width: 1.h)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: textborder, width: 1.h)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.h),
                borderSide: BorderSide(color: textborder, width: 1.h)),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 24.h,
            ),
            suffixIcon: withSufix == true
                ? GestureDetector(
                    onTap: () {
                      imagefunction;
                    },
                    child: getPaddingWidget(
                      EdgeInsets.only(right: 18.h),
                      getSvgImage(suffiximage.toString(), width: 20.h, height: 20.h),
                    ))
                : null,
            prefixIconConstraints: constraint,
            prefixIcon: isprefix == true ? prefix : null,
            hintText: s,
            hintStyle: TextStyle(
                color: subtextColor,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                fontFamily: Constant.fontsFamily)),
      );
    },
  );
}

Widget getProfileTextField(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withSufix = false,
    bool minLines = false,
    bool isPass = false,
    bool isEnable = true,
    bool isprefix = false,
    Widget? prefix,
    double? height,
    String? suffiximage,
    Function? imagefunction,
    List<TextInputFormatter>? inputFormatters,
    FormFieldValidator<String>? validator,
    BoxConstraints? constraint,
    ValueChanged<String>? onChanged,
    double vertical = 20,
    double horizontal = 20,
    int? length,
    String obscuringCharacter = '•',
    GestureTapCallback? onTap,
    bool isReadonly = false,
    TextInputType? keyboardType}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22.h),
            boxShadow: [
              BoxShadow(color: "#2423408F".toColor(), offset: const Offset(-4, 5), blurRadius: 16.h)
            ]),
        padding: EdgeInsets.symmetric(horizontal: isprefix == false ? 18.h : 0),
        child: TextFormField(
          readOnly: isReadonly,
          onTap: onTap,
          onChanged: onChanged,
          validator: validator,
          enabled: true,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLines: (minLines) ? null : 1,
          controller: textEditingController,
          obscuringCharacter: obscuringCharacter,
          autofocus: false,
          obscureText: isPass,
          showCursor: true,
          cursorColor: accentColor,
          maxLength: length,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(
              color: subtextColor,
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
              fontFamily: Constant.fontsFamily),
          decoration: InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.symmetric(vertical: 19.h),
              border: InputBorder.none,
              suffixIconConstraints: BoxConstraints(
                maxHeight: 24.h,
              ),
              suffixIcon: withSufix == true
                  ? GestureDetector(
                      onTap: () {
                        imagefunction;
                      },
                      child: getPaddingWidget(
                        EdgeInsets.only(right: 18.h),
                        getSvgImage(suffiximage.toString(), width: 20.h, height: 20.h),
                      ))
                  : null,
              prefixIconConstraints: BoxConstraints(
                maxHeight: 24.h,
              ),
              prefixIcon: isprefix == true ? prefix : null,
              hintText: s,
              hintStyle: TextStyle(
                  color: subtextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  fontFamily: Constant.fontsFamily)),
        ),
      );
    },
  );
}

Widget getMessageTextField(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withSufix = false,
    bool minLines = false,
    bool isPass = false,
    bool isEnable = true,
    bool isprefix = false,
    Widget? prefix,
    double? height,
    String? suffiximage,
    Function? imagefunction,
    List<TextInputFormatter>? inputFormatters,
    FormFieldValidator<String>? validator,
    BoxConstraints? constraint,
    ValueChanged<String>? onChanged,
    double vertical = 20,
    double horizontal = 20,
    int? length,
    String obscuringCharacter = '•',
    GestureTapCallback? onTap,
    bool isReadonly = false,
    TextInputType? keyboardType}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return TextFormField(
        readOnly: isReadonly,
        onTap: onTap,
        onChanged: onChanged,
        validator: validator,
        enabled: true,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLines: (minLines) ? null : 1,
        controller: textEditingController,
        obscuringCharacter: obscuringCharacter,
        autofocus: false,
        obscureText: isPass,
        showCursor: true,
        cursorColor: accentColor,
        maxLength: length,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 15.sp,
            fontFamily: Constant.fontsFamily),
        decoration: InputDecoration(
            counterText: "",
            contentPadding: EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.h),
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.h),
                borderSide: BorderSide(color: textFiledBorder, width: 1.h)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.h),
                borderSide: BorderSide(color: textFiledBorder, width: 1.h)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.h),
                borderSide: BorderSide(color: textFiledBorder, width: 1.h)),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 24.h,
            ),
            suffixIcon: withSufix == true
                ? GestureDetector(
                    onTap: () {
                      imagefunction;
                    },
                    child: getPaddingWidget(
                      EdgeInsets.only(right: 18.h),
                      getSvgImage(suffiximage.toString(), width: 20.h, height: 20.h),
                    ))
                : null,
            prefixIconConstraints: constraint,
            prefixIcon: isprefix == true ? prefix : null,
            hintText: s,
            hintStyle: TextStyle(
                color: subtextColor,
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                fontFamily: Constant.fontsFamily)),
      );
    },
  );
}

Widget getSearchWidget(BuildContext context, String s, TextEditingController textEditingController,
    {bool withSufix = false,
    bool minLines = false,
    bool isPass = false,
    bool isEnable = true,
    bool isprefix = false,
    Widget? prefix,
    double? height,
    String? suffiximage,
    Function? imagefunction,
    List<TextInputFormatter>? inputFormatters,
    FormFieldValidator<String>? validator,
    BoxConstraints? constraint,
    ValueChanged<String>? onChanged,
    double vertical = 17,
    double horizontal = 20,
    int? length,
    String obscuringCharacter = '•',
    GestureTapCallback? onTap,
    bool isReadonly = false}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return TextFormField(
        readOnly: isReadonly,
        onTap: onTap,
        onChanged: onChanged,
        validator: validator,
        enabled: true,
        inputFormatters: inputFormatters,
        maxLines: (minLines) ? null : 1,
        controller: textEditingController,
        obscuringCharacter: obscuringCharacter,
        autofocus: false,
        obscureText: isPass,
        showCursor: true,
        cursorColor: accentColor,
        maxLength: length,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
            fontFamily: Constant.fontsFamily),
        decoration: InputDecoration(
            counterText: "",
            contentPadding: EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.h),
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.h),
                borderSide: BorderSide(color: borderColor, width: 1.h)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.h),
                borderSide: BorderSide(color: accentColor, width: 1.h)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.h),
                borderSide: BorderSide(color: borderColor, width: 1.h)),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 24.h,
            ),
            suffixIcon: withSufix == true
                ? GestureDetector(
                    onTap: () {
                      imagefunction!();
                    },
                    child: getPaddingWidget(
                      EdgeInsets.only(right: 18.h),
                      getSvgImage(suffiximage.toString(), width: 24.h, height: 24.h),
                    ))
                : null,
            prefixIconConstraints: constraint,
            prefixIcon: isprefix == true ? prefix : null,
            hintText: s,
            hintStyle: TextStyle(
                color: greyColor,
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                fontFamily: Constant.fontsFamily)),
      );
    },
  );
}

Widget getRichText(String firstText, Color firstColor, FontWeight firstWeight, double firstSize,
    String secondText, Color secondColor, FontWeight secondWeight, double secondSize,
    {TextAlign textAlign = TextAlign.center, double? txtHeight}) {
  return RichText(
    textAlign: textAlign,
    text: TextSpan(
        text: firstText,
        style: TextStyle(
          color: firstColor,
          fontWeight: firstWeight,
          fontFamily: Constant.fontsFamily,
          fontSize: firstSize,
          height: txtHeight,
        ),
        children: [
          TextSpan(
              text: secondText,
              style: TextStyle(
                  color: secondColor,
                  fontWeight: secondWeight,
                  fontFamily: Constant.fontsFamily,
                  fontSize: secondSize,
                  height: txtHeight))
        ]),
  );
}

AppBar getToolBar(String title, GestureTapCallback onTap) {
  return AppBar(
    toolbarHeight: 36.h,
    backgroundColor: Colors.white,
    elevation: 0,
    title: getCustomFont(title, 24.sp, Colors.black, 1,
        fontWeight: FontWeight.w700, textAlign: TextAlign.start),
    leading: getPaddingWidget(
        EdgeInsets.symmetric(vertical: 6.h),
        GestureDetector(
            onTap: onTap, child: getSvgImage("arrow_left.svg", height: 24.h, width: 24.h))),
  );
}
