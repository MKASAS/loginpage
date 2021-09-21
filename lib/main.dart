import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Login_Page() ,
    )
  );
}
class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {

  final _fkey=GlobalKey<FormState>();
    bool _PasswordHideandShoe=false;
final TextEditingController _email=TextEditingController();
final TextEditingController _password=TextEditingController();
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:BorderRadius.only(
              topLeft: Radius.circular(200),
                  bottomRight: Radius.circular(250)
            )
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _fkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:100,left: 35,right: 35),
                    child: TextFormField(
                      controller:_email,
                      cursorColor: Colors.black,
                      validator: (value){
                        if(value==null||value.isEmpty){
                         return 'plese enter a vallue';
                        }
                        else{ return null;}
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "User Name",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purpleAccent,width: 2),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple,width: 3),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50,left: 35,right: 35),
                    child: TextFormField(
                      controller:_password,
                      cursorColor: Colors.black,
                      obscureText: _PasswordHideandShoe,
                      keyboardType: TextInputType.text,
                      onSaved: (value){print("${value}");},
                      validator:(value) {
                        if(value==null||value.isEmpty){
                          return 'plese enter a value';
                        }
                        else if(value.length < 8){
                          return 'Maximum  8  character  ';
                        }else if(value.length > 8){
                          return 'Minimum 8 character';
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: Colors.purpleAccent,

                          onPressed: (){
                            setState(() {
                              _PasswordHideandShoe=!_PasswordHideandShoe;
                            });
                          },
                          icon: Icon(_PasswordHideandShoe
                              ?Icons.visibility_off
                              :Icons.visibility
                          ),
                        ),
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purpleAccent,width: 2),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple,width: 3),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: FlatButton(
                      height: 50,minWidth: 100,
                      onPressed: (){
                        if(_fkey.currentState!.validate()){
                          print("Form is Valid");
                          _fkey.currentState!.save();
                        } print("Form is Not Valid");
                      },
                      child: Text('Login'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.yellow,width: 5)
                    ),

                    ),
                  ),
                ],
              ),
            ),
          ),

        ),
      )
    );
  }
}
