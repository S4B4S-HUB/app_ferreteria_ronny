import 'package:app_ferreteria_ronny/routes/appRouters.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double screenHeight = 0;
  double screenWidth = 0;

  Color primary = const Color(0xFFFAFAFA);

  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAsyncCallProcess = false;
  String? fullName;
  String? password;
  String? confirmPassword;
  String? email;
  String? direction;
  String? number;
  String? dni;
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool _agree = false;
  //CheckBox
  bool _isAccepted = false;
  bool get isAccepted => _isAccepted;

  void setAccepted(bool value){
    _isAccepted = value;
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1566e0),
        body: ProgressHUD(
          child: Form(
            key: globalKey,
            child: _registerUI(context),
          ),
          inAsyncCall: isAsyncCallProcess,
          opacity: .3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/imagenportada.png",
                  fit: BoxFit.contain,
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Ferretería Ronny",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Color(0xFFFAFAFA)),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Registro",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFFFAFAFA)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FormHelper.inputFieldWidget(
            context,
            "dni",
            "DNI",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "¡Brindenos su número de DNI!";
              }

              bool isValidDNI = RegExp(r"^[0-9]{8}$").hasMatch(onValidateVal);

              if (!isValidDNI) {
                return "¡El número de DNI ingresado es inválido!";
              }

              return null;
            },
            (onSavedVal) {
              dni = onSavedVal.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: Icon(Icons.card_membership_outlined),
            borderRadius: 10,
            contentPadding: 15,
            fontSize: 14,
            prefixIconPaddingLeft: 10,
            borderColor: Colors.grey.shade400,
            textColor: Colors.black,
            prefixIconColor: Colors.black,
            hintColor: Colors.black.withOpacity(.6),
            backgroundColor: Colors.grey.shade100,
            borderFocusColor: Colors.grey.shade200,
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            "fullName",
            "Nombre completo",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "¡Brindenos su nombre completo!";
              }
              return null;
            },
            (onSavedVal) {
              fullName = onSavedVal.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: Icon(Icons.face),
            borderRadius: 10,
            contentPadding: 15,
            fontSize: 14,
            prefixIconPaddingLeft: 10,
            borderColor: Colors.grey.shade400,
            textColor: Colors.black,
            prefixIconColor: Colors.black,
            hintColor: Colors.black.withOpacity(.6),
            backgroundColor: Colors.grey.shade100,
            borderFocusColor: Colors.grey.shade200,
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            "number",
            "Número de celular",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "¡Brindenos su número de celular!";
              }

              bool isValidPhone = RegExp(r"^[0-9]{9}$").hasMatch(onValidateVal);

              if (!isValidPhone) {
                return "¡El número de celular ingresado es inválido!";
              }

              return null;
            },
            (onSavedVal) {
              number = onSavedVal.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: Icon(Icons.phone),
            borderRadius: 10,
            contentPadding: 15,
            fontSize: 14,
            prefixIconPaddingLeft: 10,
            borderColor: Colors.grey.shade400,
            textColor: Colors.black,
            prefixIconColor: Colors.black,
            hintColor: Colors.black.withOpacity(.6),
            backgroundColor: Colors.grey.shade100,
            borderFocusColor: Colors.grey.shade200,
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            "direction",
            "Dirección",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "¡Brindenos su dirección!";
              }
              return null;
            },
            (onSavedVal) {
              direction = onSavedVal.toString().trim();
            },
            showPrefixIcon: true,
            prefixIcon: Icon(Icons.home_work_sharp),
            borderRadius: 10,
            contentPadding: 15,
            fontSize: 14,
            prefixIconPaddingLeft: 10,
            borderColor: Colors.grey.shade400,
            textColor: Colors.black,
            prefixIconColor: Colors.black,
            hintColor: Colors.black.withOpacity(.6),
            backgroundColor: Colors.grey.shade100,
            borderFocusColor: Colors.grey.shade200,
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            height: screenHeight / 1.60,
            width: screenWidth,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
                //bottomLeft: Radius.circular(60),
                //bottomRight: Radius.circular(60),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Center(
                      child: Text(
                        "Credenciales del Usuario",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    FormHelper.inputFieldWidget(
                      context,
                      "email",
                      "Correo Electrónico",
                      (onValidateVal) {
                        if (onValidateVal.isEmpty) {
                          return "¡Brindenos su email para seguir con el proceso de registro!";
                        }

                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(onValidateVal);

                        if (!emailValid) {
                          return "¡El correo electrónico ingresado es inválido!";
                        }
                        return null;
                      },
                      (onSavedVal) {
                        email = onSavedVal.toString().trim();
                      },
                      showPrefixIcon: true,
                      prefixIcon: Icon(Icons.email_outlined),
                      borderRadius: 10,
                      contentPadding: 15,
                      fontSize: 14,
                      prefixIconPaddingLeft: 10,
                      borderColor: Colors.grey.shade400,
                      textColor: Colors.black,
                      prefixIconColor: Colors.black,
                      hintColor: Colors.black.withOpacity(.6),
                      backgroundColor: Colors.grey.shade100,
                      borderFocusColor: Colors.grey.shade200,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormHelper.inputFieldWidget(
                      context,
                      "password",
                      "Contraseña",
                      (onValidateVal) {
                        if (onValidateVal.isEmpty) {
                          return "¡Cree una contraseña!";
                        }

                        bool passValid = RegExp(
                                "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{6,})")
                            .hasMatch(onValidateVal);

                        if (!passValid) {
                          return "Su contraseña es muy débil, ejemplo: 'Az06ejem#'";
                        }
                        return null;
                      },
                      (onSavedVal) {
                        password = onSavedVal.toString().trim();
                      },
                      showPrefixIcon: true,
                      prefixIcon: Icon(Icons.lock),
                      borderRadius: 10,
                      contentPadding: 15,
                      fontSize: 14,
                      prefixIconPaddingLeft: 10,
                      borderColor: Colors.grey.shade400,
                      textColor: Colors.black,
                      prefixIconColor: Colors.black,
                      hintColor: Colors.black.withOpacity(.6),
                      backgroundColor: Colors.grey.shade100,
                      borderFocusColor: Colors.grey.shade200,
                      obscureText: hidePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        color: Colors.black,
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      onChange: (val) {
                        password = val;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormHelper.inputFieldWidget(
                      context,
                      "confirmPassword",
                      "Confirmar Contraseña",
                      (onValidateVal) {
                        if (onValidateVal.isEmpty) {
                          return "¡Es necesario que se confirme la contraseña creada!";
                        }

                        if (onValidateVal != password) {
                          return "¡Las contraseñas no coinciden!";
                        }
                        return null;
                      },
                      (onSavedVal) {
                        confirmPassword = onSavedVal.toString().trim();
                      },
                      showPrefixIcon: true,
                      prefixIcon: Icon(Icons.lock),
                      borderRadius: 10,
                      contentPadding: 15,
                      fontSize: 14,
                      prefixIconPaddingLeft: 10,
                      borderColor: Colors.grey.shade400,
                      textColor: Colors.black,
                      prefixIconColor: Colors.black,
                      hintColor: Colors.black.withOpacity(.6),
                      backgroundColor: Colors.grey.shade100,
                      borderFocusColor: Colors.grey.shade200,
                      obscureText: hideConfirmPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hideConfirmPassword = !hideConfirmPassword;
                          });
                        },
                        color: Colors.black,
                        icon: Icon(
                          hideConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, AppRoutes().conditionScren);
                      },
                      child: DefaultTextStyle(
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            Checkbox(
                                value: _agree,
                                onChanged: (isChecked) {
                                  setState(() {
                                    _agree = isChecked!;
                                  });
                                }),
                            Text("Estoy de acuerdo con los"),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                " términos",
                                style: TextStyle(
                                    color: Color(0xff1566e0),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(" y "),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "condiciones",
                                style: TextStyle(
                                    color: Color(0xff1566e0),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: FormHelper.submitButton(
                        "Registrar",
                        () {
                          if (validateSave()) {};
                          
                        },
                        btnColor: Color(0xff1566e0),
                        borderColor: Colors.white,
                        txtColor: Colors.white,
                        borderRadius: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                              children: <TextSpan>[
                            TextSpan(text: "¿Ya tienes una cuenta?"),
                            TextSpan(
                              text: " Ingresar",
                              style: TextStyle(
                                color: Color(0xff1566e0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ])),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  bool validateSave() {
    final form = globalKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
