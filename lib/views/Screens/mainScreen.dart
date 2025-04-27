import 'package:flutter/material.dart';
import 'package:jobdoo/views/Screens/Register.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50.0),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("assets/images/jobDoorway logo.png"),
              ),
              SizedBox(height: 5.0,),
              Text("Find Your Dream Job Today!", style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
              SizedBox(height:120.0,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50), // width: 200, height: 50
                    backgroundColor: Colors.white, // background color
                    foregroundColor: Colors.lightBlue, // text color
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // rounded corners
                    ),
                  ),
                  onPressed: (){},
                child: Text("Login", style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900
                ),),
              ),
              SizedBox(height: 18.0,),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      )),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('OR', style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,

                      ),),
                  ),
                  Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      )),
                ],

              ),
              SizedBox(height:30.0),
              TextButton(onPressed:(){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>RegisterScreen()));
              },
                  child: Text('Open an Account', style:TextStyle(
                     fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                    color:Colors.white
                  )))
            ],
          )
        )
      ),
    );
  }
}

