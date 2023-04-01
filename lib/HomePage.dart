import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int height= 150;
  int weight=70;
  late double bmi= clculateBMI(height: height, weight: weight);
  String gender="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState((){
                          gender="m";
                        });
                      },
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            color :gender== "m" ? Colors.amber:Colors.yellow,
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            Icon(Icons.male,size:150),
                            Text("Male",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        setState((){
                          gender="f";
                        });
                      },
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            color :gender== "f" ? Colors.amber:Colors.yellow,
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            Icon(Icons.female,size:150),
                            Text("Female",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children:  [
                          const Text("Height in cm" ,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                          Text("$height", style:const TextStyle(fontSize: 50, color: Colors.lightBlue ),),
                          Row(
                            children:  [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FloatingActionButton(onPressed: (){
                                  setState(() {
                                    bmi= clculateBMI(height: height, weight: weight);
                                    height++;
                                  });
                                }, child: const Icon(Icons.add),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FloatingActionButton(onPressed: (){
                                  setState(() {
                                    bmi= clculateBMI(height: height, weight: weight);
                                    height--;
                                  });
                                }, child: const Icon(Icons.remove),),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children:  [
                            const Text("Weight in kg" ,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                            Text("$weight", style:const TextStyle(fontSize: 50, color: Colors.lightBlue ),),
                            Row(
                              children:[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FloatingActionButton(onPressed: (){
                                    setState(() {
                                      bmi= clculateBMI(height: height, weight: weight);
                                      weight++;
                                    });
                                  },child: const Icon(Icons.add),),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FloatingActionButton(onPressed: (){
                                    setState(() {
                                      bmi= clculateBMI(height: height, weight: weight);
                                      weight--;
                                    });
                                  },child: const Icon(Icons.remove),),
                                )
                              ],
                            )
                          ],
                        ),
                    ),
                  ],
                ),
                Column(
                  children:  [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("BMI Value",style: TextStyle(fontSize: 50,color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    ),
                    Text(bmi.toStringAsFixed(2),style: const TextStyle(fontSize: 70,color: Colors.redAccent),),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(getResult(bmi),style: const TextStyle(fontSize: 60,color: Colors.brown),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
  double clculateBMI({required int height,required int weight}){
    return weight/(height/100*height/100);

  }
  String getResult(bmi){
    if(bmi>=25){
      return 'Over Weight';
    }
    else if(bmi>18.5){
      return 'Normal';
    }else{
      return 'Under Weight';
    }
  }
}
