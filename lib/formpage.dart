import 'package:flutter/material.dart';
import 'secondpage.dart';

class MyForm extends StatefulWidget{
  const MyForm({super.key});

  @override
  MyFormState createState(){
    return MyFormState();
  }
}

class MyFormState extends State<MyForm>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final firstController  = TextEditingController();
    final secondController = TextEditingController();

    return Form(
      key: _formKey,
      child:Container(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Container(
              padding: EdgeInsets.all(10),
              child: Image.network(
                  'https://img.jakpost.net/c/2019/11/22/2019_11_22_82666_1574392699._large.jpg'
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                style: TextStyle(fontSize: 24),
                decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.grey
                        )
                    ),
                    labelText: 'Masukan input pertama',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.email),
                    )
                ),
                controller: firstController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Container(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  style: TextStyle(fontSize: 24),
                  decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.grey
                        )
                    ),
                    labelText: 'Masukan input kedua',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.password),
                    ),
                  ),
                  controller: secondController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )
            ),

            Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: ElevatedButton(
                    onPressed: (){
                      List<String> formData = [];

                      String kirim1 = firstController.text;
                      String kirim2 = secondController.text;

                      formData.add(kirim1);
                      formData.add(kirim2);

                      /*AlertDialog alert = AlertDialog(
                        title: Text("Coba get data"),
                        content: Text(kirim1+" - "+kirim2),
                      );

                      showDialog(context: context,
                          builder:(BuildContext context){
                            return alert;
                          }
                      );*/

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondLayout(data: formData)
                          )
                      );
                    },
                    child: const Text("Submit"))
            )
          ],
        ),
      ),
    );
  }
}