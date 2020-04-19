import 'dart:io';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:provider/provider.dart';

import 'package:flutter_offers/models/user.dart';
import 'package:flutter_offers/services/database.dart';
import 'package:flutter_offers/ui/widget/red_material_button.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  StorageReference storageReference;

  File userAvatar;
  String firstName = '';
  String secondName = '';
  String dateOfBirth = '';
  String gender = '';

  bool loading = false;

  final FocusNode _firstNameNode = FocusNode();
  final FocusNode _secondNameNode = FocusNode();
  final FocusNode _dateOfBirthNode = FocusNode();

  changeFocus(BuildContext context, FocusNode node) =>
      FocusScope.of(context).requestFocus(node);

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            if (gender.isEmpty && userData.gender.isNotEmpty)
              gender = userData.gender;
            storageReference = FirebaseStorage.instance
                .ref()
                .child("users/${user.uid}/avatar");

            return loading
                ? WaitSavingChanges()
                : Scaffold(
                    backgroundColor: Color(0xFFF6F6F6),
                    appBar: AppBar(
                      title: Text('Профиль'),
                    ),
                    body: SingleChildScrollView(
                      child: Center(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 35.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 80.0),
                                      child: CircleAvatar(
                                        radius: 45.0,
                                        backgroundImage: userAvatar == null
                                            ? userData.userAvatarURL == null
                                                ? AssetImage(
                                                    'assets/images/avatar.png')
                                                : NetworkImage(
                                                    userData.userAvatarURL)
                                            : FileImage(userAvatar),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 35.0),
                                      child: IconButton(
                                        onPressed: () async {
                                          var image =
                                              await ImagePicker.pickImage(
                                                  source: ImageSource.gallery);

                                          setState(() {
                                            userAvatar = image;
                                          });
                                        },
                                        icon: Icon(Icons.camera_enhance),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: TextFormField(
                                        initialValue: userData.firstName,
                                        validator: (val) =>
                                            val.isEmpty ? 'Введите имя' : null,
                                        onChanged: (value) {
                                          setState(() => firstName = value);
                                        },
                                        onFieldSubmitted: (v) => changeFocus(
                                            context, _secondNameNode),
                                        focusNode: _firstNameNode,
                                        decoration: _inputDecoration.copyWith(
                                            labelText: 'Имя'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: TextFormField(
                                        initialValue: userData.secondName,
                                        onChanged: (value) {
                                          setState(() => secondName = value);
                                        },
                                        onFieldSubmitted: (v) => changeFocus(
                                            context, _dateOfBirthNode),
                                        focusNode: _secondNameNode,
                                        decoration: _inputDecoration.copyWith(
                                            labelText: 'Фамилия'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: DateTimeField(
                                        initialValue: userData
                                                .dateOfBirth.isEmpty
                                            ? DateTime.tryParse('')
                                            : DateFormat.yMMMMd('ru')
                                                .parse(userData.dateOfBirth),
                                        onChanged: (value) {
                                          setState(() => dateOfBirth =
                                              DateFormat.yMMMMd('ru')
                                                      .format(value) ??
                                                  '');
                                        },
                                        focusNode: _dateOfBirthNode,
                                        decoration: _inputDecoration.copyWith(
                                            labelText: 'Дата рождения'),
                                        format: DateFormat.yMMMMd('ru'),
                                        onShowPicker: (context, currentValue) {
                                          return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1900),
                                            initialDate:
                                                currentValue ?? DateTime.now(),
                                            lastDate: DateTime.now()
                                                .add(Duration(days: 31)),
                                            locale: const Locale("ru", "RU"),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          26.0, 12.0, 0.0, 0.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text('Пол',
                                            style: TextStyle(
                                                color: Color(0xFFFF473D),
                                                fontSize: 14)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                value: 'Мужской',
                                                activeColor: Color(0xFFFF473D),
                                                groupValue: gender,
                                                onChanged: (val) => setState(
                                                    () => gender = val),
                                              ),
                                              Text(
                                                'Мужской',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 60.0),
                                            child: Row(
                                              children: <Widget>[
                                                Radio(
                                                  value: 'Женский',
                                                  activeColor:
                                                      Color(0xFFFF473D),
                                                  groupValue: gender,
                                                  onChanged: (val) => setState(
                                                      () => gender = val),
                                                ),
                                                Text('Женский',
                                                    style: TextStyle(
                                                        fontSize: 16)),
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
                                padding: const EdgeInsets.only(
                                    top: 75.0, bottom: 16.0),
                                child: RedMaterialButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80.0, vertical: 15.0),
                                  title: 'Сохранить изменения',
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() => loading = true);
                                      String url;
                                      if (userAvatar != null) {
                                        final StorageUploadTask uploadTask =
                                            storageReference
                                                .putFile(userAvatar);
                                        final StorageTaskSnapshot downloadUrl =
                                            (await uploadTask.onComplete);
                                        url = (await downloadUrl.ref
                                            .getDownloadURL());
                                        print("URL is $url");
                                      }
                                      await DatabaseService(uid: user.uid)
                                          .updateUserData(UserData(
                                              firstName: firstName.isEmpty
                                                  ? userData.firstName
                                                  : firstName,
                                              secondName: secondName.isEmpty
                                                  ? userData.secondName
                                                  : secondName,
                                              dateOfBirth: dateOfBirth.isEmpty
                                                  ? userData.dateOfBirth
                                                  : dateOfBirth,
                                              gender: gender,
                                              userAvatarURL: userAvatar == null
                                                  ? userData.userAvatarURL
                                                  : url));
                                      setState(() => loading = false);
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
          } else {
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

class WaitSavingChanges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                'Сохранение изменений',
                style: Theme.of(context).textTheme.subtitle,
              ),
            )
          ],
        )));
  }
}

InputDecoration get _inputDecoration {
  return InputDecoration(
    fillColor: Color(0xFFFFFFFF),
    filled: true,
    labelStyle: TextStyle(color: Color(0xFFFF473D), fontSize: 14),
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
      borderSide: BorderSide(color: Colors.black.withOpacity(0.14), width: 1.0),
    ),
  );
}
