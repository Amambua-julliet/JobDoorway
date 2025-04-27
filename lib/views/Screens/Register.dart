import 'package:flutter/material.dart';
import 'package:jobdoo/views/Screens/Employer/EmployerRegistration.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Registration', style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color:Colors.white

        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Icon(Icons.account_circle,
                    size: 60.0,
                    color: Colors.lightBlue,
                  ),
                  SizedBox(width: 28.0,),
                  Expanded(
                      child: Text('We will need some personal informations to create and mange your account on JobDoorway',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5, style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                        ),))
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Icon(Icons.camera_alt_outlined,
                      size: 60.0,
                      color: Colors.lightBlue,
                    ),
                    SizedBox(width: 28.0,),
                    Expanded(
                        child: Text('To ensure the security of your account and also prevent it from frudulent activities we will require you to submit a photo of yourself and ID',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5, style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold
                          ),))
                  ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Icon(Icons.checklist,
                      size: 60.0,
                      color: Colors.lightBlue,
                    ),
                    SizedBox(width: 28.0,),
                    Expanded(
                        child: Text('After receiving your information we'"ll perform a check with reputable agencies",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5, style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold
                          ),))
                  ]
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.only(left:42.0),
              child: Center(
                child: Text("Ready to apply for your account with JoBDoorWay", style: TextStyle(
                   fontSize: 18.0,
                   fontWeight: FontWeight.bold
                ),),
              ),
            ),
            SizedBox(height: 12.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50), // width: 200, height: 50
                    backgroundColor: Colors.lightBlue, // background color
                    foregroundColor: Colors.white, // text color
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // rounded corners
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>CountryCode()));
                  },
                  child: Text("Employer", style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900
                  ),),
                ),
                SizedBox(width: 18.0,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50), // width: 200, height: 50
                    backgroundColor: Colors.lightBlue, // background color
                    foregroundColor: Colors.white, // text color
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // rounded corners
                    ),
                  ),
                  onPressed: (){},
                  child: Text("Job Seeker", style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900
                  ),),
                ),
              ],
            )

          ]
        ),
      ),
    );
  }
}
