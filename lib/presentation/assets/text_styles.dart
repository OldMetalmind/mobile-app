import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimensions.dart';

TextStyle styleBottomBarText() => TextStyle(
      color: colorPrimary,
    );

TextStyle styleButtonText() => TextStyle(
    color: Colors.white, fontSize: textSizeNormal, fontWeight: FontWeight.w600);

TextStyle styleIntroContent() =>
    TextStyle(fontSize: textSizeIntroContent, color: colorTextGrey);

TextStyle styleIntroTitle() => TextStyle(
      fontSize: textSizeIntroTitle,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

TextStyle styleBottomBarTextAboutPage() => TextStyle(
      color: Colors.white,
      fontSize: textSizeLarge,
    );

TextStyle styleContentTextAboutPage() => TextStyle(
      color: Colors.black,
      fontSize: textSizeLarge,
    );

TextStyle styleContactHeadingAboutPage() => TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: textSizeHeading,
    );

TextStyle styleOccurrencesSubText() => TextStyle(
      color: colorTextGrey,
    );

TextStyle styleFlatButton() => TextStyle(
      fontSize: textSizeButton,
    );

TextStyle styleOccurrenceTitle() => TextStyle(
  fontSize: textSizeMedium,
  fontWeight: FontWeight.w400,
);

TextStyle styleLastUpdated() => TextStyle(
  fontSize: textSizeNormal,
  color: colorTextGrey
);

TextStyle styleMeans() => TextStyle(
  fontSize: textSizeNormal,
  color: colorTextGrey,
  fontWeight: FontWeight.w600,
);


TextStyle styleMeansNumber() => TextStyle(
  fontSize: textSizeLarge,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

TextStyle styleTimeWidgetText() => TextStyle(
  fontSize: textSizeLarge,
  color: Colors.green,
  fontWeight: FontWeight.bold,
);
