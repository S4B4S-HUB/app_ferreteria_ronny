import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var po = context;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(height: size.height * 0.008),
              Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.035),
                child: Row(
                  children: [
                    Icon(
                      Icons.article_outlined,
                      size: size.height * 0.07,
                      color: Color(0xff1566e0),
                    ),
                    SizedBox(width: size.width * 0.04),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Términos y Condiciones",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                            fontSize: size.height * 0.024,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Última actualización: Julio 23, 2022",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                            fontSize: size.height * 0.0175,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.015),
              Expanded(
                child: Container(),
              ),
              SizedBox(height: size.height * 0.015),
              Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.035),
                child: Row(
                  children: [
                    Expanded(
                      child: TermsButton(
                        title: "Declinar",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: size.height * 0.025),
                    Expanded(
                      child: TermsButton(
                        isAccepted: true,
                        title: "Aceptar",
                        onTap: () {
                          print("LIKED");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.025),
            ],
          ),
        ),
      ),
    );
  }
}

class TermsButton extends StatelessWidget {
  final String title;
  final bool isAccepted;
  final VoidCallback onTap;
  // ignore: use_key_in_widget_constructors
  const TermsButton({
    required this.title,
    required this.onTap,
    this.isAccepted = false,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.013,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff1566e0),
              width: size.width * 0.005,
            ),
            color: isAccepted ? Color(0xff1566e0) : Colors.white,
            borderRadius: BorderRadius.circular(size.height * 0.01),
          ),
          child: Text(
            "$title",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: size.height * 0.022,
              fontWeight: FontWeight.w600,
              color: isAccepted ? Colors.white : Color(0xff1566e0),
            ),
          ),
        ),
    );
  }
}
