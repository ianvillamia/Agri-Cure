import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * .1,
              ),
              Opacity(
                opacity: .6,
                child: Container(
                  width: size.width * .8,
                  height: size.height * .3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/login-pic.png'))),
                ),
              ),
              Container(
                width: size.width * .8,
                height: size.height * .5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Welcome',
                      style: CustomTextStyles.boldText(size: 30),
                    ),
                    Text(
                      'Sign in to continue',
                      style: CustomTextStyles.coloredText(
                          color: Colors.grey, size: 20),
                    ),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    Center(
                      child: Container(
                        width: size.width * .6,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8.0),
                            labelText: 'Email address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "JohnDoe@email.com",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Center(
                      child: Container(
                        width: size.width * .6,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8.0),
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "**********",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Center(
                      child: Container(
                          width: size.width * .6,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('Forgot Password?'),
                          )),
                    ),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    Center(
                      child: MaterialButton(
                        height: size.height * .07,
                        minWidth: size.width * .6,
                        color: Color.fromRGBO(20, 170, 105, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () {
                          //material to next screen
                        },
                        child: Text(
                          'Login',
                          style: CustomTextStyles.whiteText(),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
