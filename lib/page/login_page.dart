import 'package:flutter/material.dart';
import 'package:oneline_absen/bloc/pengajuan_izin_bloc.dart';
import 'package:oneline_absen/page/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 80),
                child: Image(
                  image: AssetImage("images/logo_login.png"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 180, 12, 12),
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * (1 / 100),
                        0,
                        MediaQuery.of(context).size.width * (1 / 100),
                        25),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Silahkan melakukan Login",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  blurRadius: 8,
                                  offset: Offset(1, 1),
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 0.8),
                            ],
                          ),
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: _emailTextEditingController,
                            showCursor: true,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Text(
                          "Kata Sandi",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  blurRadius: 8,
                                  offset: Offset(1, 1),
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 0.8),
                            ],
                          ),
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: _passwordTextEditingController,
                            obscureText: _passwordVisible,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardPage()),
                                );
                              },
                              child: Text("Masuk"),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(225, 64, 90, 183)))),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 180),
                          child: Text(
                            "Lupa Kata Sandi",
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildTextField(TextEditingController controller, bool obsecure) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              blurRadius: 8,
              offset: Offset(1, 1),
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 0.8),
        ],
      ),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
