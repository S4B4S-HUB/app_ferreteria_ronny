import 'package:app_ferreteria_ronny/pages/terms_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  PageTransition conditionScren = PageTransition(
    child: TermsAndConditions(), 
    type: PageTransitionType.rotate,
    alignment: Alignment.center,
    curve: Curves.easeInOutBack,
    duration: const Duration(milliseconds: 800),
    );
}