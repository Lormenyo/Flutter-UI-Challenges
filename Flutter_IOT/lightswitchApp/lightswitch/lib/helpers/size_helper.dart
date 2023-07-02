import 'package:flutter/material.dart';

Size getDisplaySize(BuildContext context) {
  return MediaQuery.sizeOf(context);
}

double getDisplayHeight(BuildContext context) {
  return getDisplaySize(context).height;
}

double getDisplayWidth(BuildContext context) {
  return getDisplaySize(context).width;
}
