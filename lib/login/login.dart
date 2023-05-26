
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:web_app/home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController editingControllerPopMenu = TextEditingController();
  TextEditingController editingControllerMyList = TextEditingController();

  TextEditingController txtTimeController1 = TextEditingController();
  TextEditingController txtTimeController2 = TextEditingController();

  bool isSignUp = true;


  _loginWidget(){
    return
      Container(
      height: 390,
      width: 350,
      decoration: const BoxDecoration(
        color: Color(0xFF263238),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
              blurRadius: 4,
              spreadRadius: 3,
              offset: Offset(0, 4),
          )
        ],
      ),

      child:
      Column(
        children: [
          const SizedBox(height: 10,),
          const Text("Log In", style: TextStyle(color: Colors.white, fontSize: 25),),
          const SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
            },
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
              filled: true,
              contentPadding: const EdgeInsets.only(
                  left: 14.0, bottom: 6.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[700]!),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26),
              ),
            ),
          ),
          ),
          const SizedBox(height: 10,),
         Container(
           margin: const EdgeInsets.only(left: 20,right: 20),
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
            },
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
              filled: true,
              contentPadding: const EdgeInsets.only(
                  left: 14.0, bottom: 6.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[700]!),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26),
              ),
            ),
          ),
         ),
          const SizedBox(height: 10,),
          Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(right: 20),
          child: TextButton(onPressed: (){}, child: Text("Forgot password?", style: TextStyle(color: Colors.teal[200], fontSize: 15),),),
          ),
          const SizedBox(height: 15,),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: ElevatedButton( onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
              },
              child: const Text("LOG IN",style: TextStyle(color: Colors.white,fontSize: 17),),),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 1,
                color: Colors.blueGrey[500],
                width: 130,
                margin: const EdgeInsets.only(left: 10),
              ),
              const Text(" OR ", style: TextStyle(color: Colors.white60,fontSize: 16),),
              Container(
                height: 1,
                color: Colors.blueGrey[500],
                width: 130,
                margin: const EdgeInsets.only(right: 10),
              ),
            ],
          ),
          const SizedBox(height: 20,),
           Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20,right: 20),
             child: OutlinedButton.icon(style: ButtonStyle(
                 side: MaterialStateProperty.all(const BorderSide(color: Colors.white60, // width: 1.0,
                     style: BorderStyle.solid))),onPressed: () {  }, icon: const Icon(Icons.abc),
             label: const Text("Use Google",style: TextStyle(color: Colors.white60,fontSize: 17),),),

           ),
          const SizedBox(height: 20,),
        ],

      ),
    );
  }


  _registerWidget(){
    return
      Container(
      height: 360,
      width: 350,
      decoration: const BoxDecoration(
        color: Color(0xFF263239),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 4,
            spreadRadius: 3,
            offset: Offset(0, 4),
            // shadow direction: bottom right
          )
        ],
      ),

      child:
      Column(
        children: [
          const SizedBox(height: 10,),
          const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 25),),
          const SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
              },
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
                filled: true,
                contentPadding: const EdgeInsets.only(
                    left: 14.0, bottom: 6.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[700]!),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
              },
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
                filled: true,
                contentPadding: const EdgeInsets.only(
                    left: 14.0, bottom: 6.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[700]!),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25,),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: ElevatedButton( onPressed: (){}, child: const Text("SIGN UP",style: TextStyle(color: Colors.white,fontSize: 17),),),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 1,
                color: Colors.blueGrey[500],
                width: 130,
                margin: const EdgeInsets.only(left: 10),
              ),
              const Text(" OR ", style: TextStyle(color: Colors.white60,fontSize: 16),),
              Container(
                height: 1,
                color: Colors.blueGrey[500],
                width: 130,
                margin: const EdgeInsets.only(right: 10),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: OutlinedButton.icon(style: ButtonStyle(
                side: MaterialStateProperty.all(const BorderSide(color: Colors.white60, // width: 1.0,
                    style: BorderStyle.solid))),onPressed: () {  }, icon: const Icon(Icons.abc),
              label: const Text("Use Google",style: TextStyle(color: Colors.white60,fontSize: 17),),),

          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blueGrey[800],
          child:
          SingleChildScrollView(child:
          Column(
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("TrackMyWork", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                ],
              ),
              const SizedBox(height: 200,),
              Align(
                alignment: Alignment.center,
                child: isSignUp ? _loginWidget() : _registerWidget(),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(isSignUp ? "Don't have an account?" : "You have an account?", style: const TextStyle(color: Colors.white70, fontSize: 15),),
                   TextButton(onPressed: (){ setState(() {
                    isSignUp = !isSignUp;
                  });}, child:  Text(isSignUp  ? "Sign Up" : "Log In" , style: const TextStyle(color: Colors.blue, fontSize: 18),),),
               ],
              ),
            ],
          ),
          ),
          ),
    );
  }
}
