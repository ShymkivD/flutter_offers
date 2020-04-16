import 'package:flutter/material.dart';
import 'package:flutter_offers/custom_routes.dart';
import 'package:flutter_offers/services/auth.dart';
import 'package:flutter_offers/ui/widget/inputs/auth_input_text_field.dart';
import 'package:flutter_offers/ui/widget/red_material_button.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

// text field state
  String email = '';
  String password = '';
  String repeatPassword = '';

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _repeatPasswordNode = FocusNode();

  changeFocus(BuildContext context, FocusNode node) =>
      FocusScope.of(context).requestFocus(node);
  @override
  Widget build(BuildContext context) => loading
      ? Container(
          color: Colors.white,
          child: Center(child: CircularProgressIndicator()))
      : Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomCenter,
              colors: [
                Color(0xFF27C189),
                Color(0xFF237BBF),
              ],
            )),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: FlatButton(
                          onPressed: () => widget.toggleView(),
                          child: Text('Войти')),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                          child: Image.asset(
                        'assets/images/logo.png',
                        scale: 2.5,
                      )),
                    ],
                  )),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              AuthInputTextField(
                                onFieldSubmitted: (v) =>
                                    changeFocus(context, _passwordNode),
                                error: error.isEmpty ? '' : 'error',
                                validator: (val) =>
                                    val.isEmpty ? 'Введите email' : null,
                                changeCallback: (value) {
                                  setState(() => email = value);
                                },
                                action: TextInputAction.next,
                                hintText: "Email",
                                textInputType: TextInputType.emailAddress,
                                node: _emailNode,
                              ),
                              AuthInputTextField(
                                onFieldSubmitted: (v) =>
                                    changeFocus(context, _repeatPasswordNode),
                                obscure: true,
                                error: error.isEmpty ? '' : 'error',
                                validator: (value) => value.length < 6
                                    ? 'Введите пароль длинее чем 6 символов'
                                    : null,
                                changeCallback: (value) => setState(() {
                                  return password = value;
                                }),
                                action: TextInputAction.next,
                                hintText: 'Пароль',
                                textInputType: TextInputType.multiline,
                                node: _passwordNode,
                              ),
                              AuthInputTextField(
                                error: error.isEmpty ? '' : 'error',
                                obscure: true,
                                changeCallback: (value) => setState(() {
                                  return repeatPassword = value;
                                }),
                                validator: (value) => value != password
                                    ? 'Пароли не совпадают'
                                    : null,
                                action: TextInputAction.next,
                                hintText: "Повторите пароль",
                                textInputType: TextInputType.multiline,
                                node: _repeatPasswordNode,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: RedMaterialButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70.0, vertical: 15.0),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              return loading = true;
                            });
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error = 'Ошибка ввода';
                              });
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, CustomRoutes.HOME_PAGE);
                            }
                          }
                        },
                        title: 'Зарегистрироваться'),
                  ),
                  error.isEmpty
                      ? SizedBox()
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                        )
                ],
              ),
            ),
          ),
        );
}
