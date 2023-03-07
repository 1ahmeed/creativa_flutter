import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
var emailController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isSecure=true;
  IconData? suffix= Icons.visibility;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
          children: [
            const Image(image: AssetImage('assets/images/kk.jpg'),
              height: 900, fit: BoxFit.cover,width: double.infinity,),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text("LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter your email';
                              }
                              else if (!value.contains("@") || !value.contains("."))
                                return " email must have '@' and '.'";
                            },
                            decoration: const InputDecoration(
                              focusedBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              ),
                              errorStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white),
                              // border: OutlineInputBorder(),
                              label: Text('Email'),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            obscureText: isSecure,

                            //?Icon(Icons.visibility_off_sharp):Icon(Icons.visibility)
                            validator: (value) {
                              if(value!.isEmpty){
                                return'enter your password ';
                              }
                              if (value.length <= 6)
                                return ' password must have more than 6 nums';
                            },

                            decoration:  InputDecoration(
                              suffixIcon:IconButton(onPressed:(){
                                setState(() {
                                  isSecure = !isSecure;
                                  suffix=isSecure? Icons.visibility:Icons.visibility_off_sharp;
                                });

                              }, icon:Icon(suffix,color: Colors.white,)),

                              focusedBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              ),
                              errorStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white),
                              // border: OutlineInputBorder(),
                              label: Text('Password'),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.of(context).pushReplacementNamed(
                                        'search');
                                  }
                                });
                              },
                              child: Text('Submit')),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Forget Password')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
