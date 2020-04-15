import 'package:flutter/material.dart';
import 'package:flutter_offers/custom_routes.dart';
import 'package:flutter_offers/services/auth.dart';
import 'package:flutter_offers/ui/widget/auth_input_text_field.dart';
import 'package:flutter_offers/ui/widget/red_material_button.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

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
                          child: Text('Зарегистрироваться')),
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
                                obscure: true,
                                error: error.isEmpty ? '' : 'error',
                                validator: (value) => value.length < 6
                                    ? 'Введите пароль длинее чем 6 символов'
                                    : null,
                                changeCallback: (value) => setState(() {
                                  return password = value;
                                }),
                                action: TextInputAction.next,
                                hintText: "Пароль",
                                textInputType: TextInputType.multiline,
                                node: _passwordNode,
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
                            horizontal: 127.0, vertical: 15.0),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              return loading = true;
                            });
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error = 'Невозможно войти с этими данными';
                              });
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, CustomRoutes.HOME_PAGE);
                            }
                          }
                        },
                        title: 'Войти'),
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
