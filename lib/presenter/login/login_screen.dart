import 'package:flutter/material.dart';
import 'package:giv_test/presenter/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _isRemember = false;
  var _isError = false;
  var _showPassword = true;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 56, vertical: 16),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/login_background.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Stack(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/adept_logo.png',
                      width: 110,
                    ),
                    Text('Welcome back!')
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    _isError ? 'Please fill the Email and Password first.' : '',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ]),
            ),
            Form(
              key: _formKey,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                padding: EdgeInsets.symmetric(horizontal: 56, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextFormField(
                          onChanged: (val) {
                            setState(() {
                              _isError = false;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: _isError
                                ? UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red))
                                : null,
                          ),
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _showPassword,
                          onChanged: (val) {
                            setState(() {
                              _isError = false;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              hintText: 'Password',
                              suffixIcon: _showPassword
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _showPassword = !_showPassword;
                                        });
                                      },
                                      child:
                                          Icon(Icons.remove_red_eye_outlined))
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _showPassword = !_showPassword;
                                        });
                                      },
                                      child: Icon(Icons.remove_red_eye))),
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: _isRemember,
                                onChanged: (val) {
                                  setState(() {
                                    _isRemember = val!;
                                  });
                                }),
                            Text('Remember me')
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Image.asset(
                                'assets/images/fingerprint_icon.png'),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              } else {
                                setState(() {
                                  _isError = true;
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[
                                      Color(0XFF898B96),
                                      Color(0XFF383838)
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sign In',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.black),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
