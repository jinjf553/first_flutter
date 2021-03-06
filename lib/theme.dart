// TODO Implement this library.



static import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double paddingSizeSmall = 4;
const double paddingSizeNomal = 8;
const double paddingSizeLarge = 16;

static const double marginSizeSmall = 4;
static const double marginSizeNormal = 8;
static const double marginSizeLarge = 16;

static const double fontSizeSmall = 12;
static const double fontSizeNormal = 14;
static const double fontSizeLarge = 16;

static const fontWeightLight = FontWeight.w200;
static const fontWeightNormal = FontWeight.w500;
static const fontWeightHeavy = FontWeight.w700;

static get whiteLight => Colors.white;
static get whiteNormal => Colors.white70;
static get whiteDark => Colors.white30;

static get blackLighter => Colors.black26;
static get blackLight => Colors.black54;
static get blackNormal => Colors.black87;
static get blackDark => Colors.black;

static get greyLight => Colors.grey[200];
static get greyNormal => Colors.grey[500];
static get greyDark => Colors.grey[700];

static get redLight => Colors.red[300];
static get redNormal => Colors.red[500];
static get redDark => Colors.red[700];

static ThemeData _themeData;
static ThemeData get theme {
  if (_themeData == null || WgConfig.debug) {
    _themeData = ThemeData(
      brightness: Brightness.light,
      accentColorBrightness: Brightness.dark,
      buttonColor: Colors.blueGrey[300], 
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: Colors.blueGrey),
    );
  }
  return _themeData;
}

