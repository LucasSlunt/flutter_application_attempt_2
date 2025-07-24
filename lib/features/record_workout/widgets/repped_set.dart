import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data_classes/repped_set.dart';

class ReppedSetWidget extends StatefulWidget{
  final ReppedSet set;

  const ReppedSetWidget({super.key, required this.set});

  @override 
  ReppedSetState createState() => ReppedSetState();
}

class ReppedSetState extends State<ReppedSetWidget> {
  final repTextController = TextEditingController();
  final weightTextController = TextEditingController();

  @override
    void dispose(){
      repTextController.dispose();
      weightTextController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context){
    
    return Container(
      color: Colors.blue,
      height: 50,
      width: 200,
      margin: EdgeInsets.all(10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //REPS BOX
          SizedBox(
            width: 50,
            child:
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[1234567890]'))
              ],
              onChanged: (text) {
                widget.set.setNumberOfReps(int.parse(text));
                print("reps:${widget.set.getNumberOfReps()}");
              },
              controller: repTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "0",
                
                ),
              ),
      ),
          //WEIGHT BOX
          SizedBox(
            width: 50,
            child:
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('\\d+.{0,1}\\d*'))
              ],
              onChanged: (text) {
                widget.set.setWeightPerRep(double.parse(text));
                print("reps:${widget.set.getWeightPerRep()}");
              },
              controller: weightTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "0",
                
                ),
              ),
      ),
        ],
      )
    );
    
  }
}