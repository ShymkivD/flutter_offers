import 'package:flutter/material.dart';
import 'package:flutter_offers/ui/widget/red_material_button.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        title: Text('Профиль'),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 45.0),
                        child: Image.asset(
                          'assets/images/avatar.png',
                          scale: 1.7,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Icon(
                          Icons.camera_enhance,
                          color: Colors.black.withOpacity(0.30),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                            labelText: 'Имя',
                            labelStyle: TextStyle(
                                color: Color(0xFFFF473D), fontSize: 14),
                            contentPadding: EdgeInsets.all(12.0),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFFFFFF),
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.14),
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.14),
                                  width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                            labelText: 'Фамилия',
                            labelStyle: TextStyle(
                                color: Color(0xFFFF473D), fontSize: 14),
                            contentPadding: EdgeInsets.all(12.0),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFFFFFF),
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.14),
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.14),
                                  width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                            labelText: 'Дата рождения',
                            labelStyle: TextStyle(
                                color: Color(0xFFFF473D), fontSize: 14),
                            contentPadding: EdgeInsets.all(12.0),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFFFFFF),
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.14),
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.14),
                                  width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(26.0, 12.0, 0.0, 0.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('Пол',
                              style: TextStyle(
                                  color: Color(0xFFFF473D), fontSize: 14)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 'Мужской',
                                  groupValue: 5,
                                  onChanged: (a) {},
                                ),
                                Text(
                                  'Мужской',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 60.0),
                              child: Row(
                                children: <Widget>[
                                  Radio(
                                    value: 'Женский',
                                    groupValue: 6,
                                    onChanged: (a) {},
                                  ),
                                  Text('Женский',
                                      style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90.0, bottom: 16.0),
                  child: RedMaterialButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80.0, vertical: 15.0),
                    title: 'Сохранить изменения',
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
