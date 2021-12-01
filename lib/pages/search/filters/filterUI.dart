import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pc/pages/search/filters/part_filter.dart';


class FilterUI extends StatefulWidget{

  final Filter fil;

  FilterUI(this.fil);

  @override
  _FilterUIState createState() => _FilterUIState();

}

class _FilterUIState extends State<FilterUI> {


  @override
  Widget build(BuildContext context) {




    var sliderOptions = widget.fil.rangeFilters;
    var checkBoxOptions = widget.fil.checkboxFilters;



    void _listOfCheckBoxes(Map<String, dynamic> optionGroup) {

      var keys = optionGroup.keys.toList();

      //bool x = optionGroup["All"];

      showModalBottomSheet(context: context, builder: (context){

        return ListView.builder(

                itemCount: optionGroup.length,
                itemBuilder: (context, index){



                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {

                        if(optionGroup["All"] == true){
                          for (var i = 1; i < optionGroup.length - 1; i++)
                            optionGroup[keys[index]] = true;
                        }

                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66c290),

                          title: Text(keys[index]),
                          value: optionGroup[keys[index]],
                          //onChanged: x? null:(bool val)
                          onChanged: (bool val)
                          {
                            setState(() {
                              if(keys[index] != "All" && optionGroup["All"] == true){
                                for (var i = 1; i < optionGroup.length - 1; i++)
                                  optionGroup[keys[index]] = true;
                              }
                              else
                                optionGroup[keys[index]] = val;

                            },);

                          },
                        );
                      }
                  );
                }
            );
        });
    }

    ListView getCheckBoxGroup(Map<String, dynamic> allOptions){

      var keys = allOptions.keys.toList();

      return ListView.builder(
           physics: ClampingScrollPhysics(),
           shrinkWrap: true,
          itemCount: allOptions.length,
          itemBuilder: (context, index){

            return ListTile(
              title: Text(keys[index]),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: (){
                _listOfCheckBoxes(allOptions[keys[index]]);
              },
            );
          }
      );
    }

    StatefulBuilder _sliderTile(String title, Map<String, dynamic> rangeOption) {

      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {

            return Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0)),
                Text(title),

                RangeSlider(

                  activeColor: Color(0xff66c290),
                  values: rangeOption['range'],
                  min: rangeOption['min'],
                  max: rangeOption['max'],
                  divisions: rangeOption['max'].toInt(),
                  labels: RangeLabels(
                    rangeOption['range'].start.round().toString(),
                    rangeOption['range'].end.round().toString(),
                  ),
                  onChanged: (RangeValues newRange) {
                    setState(() => rangeOption['range'] = newRange);
                  },
                )
              ],
            );
          }
      );
    }


    ListView getSliderGroup(Map<String, dynamic> allOptions){

      var keys = allOptions.keys.toList();

      return ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
        itemCount:allOptions.length,
        itemBuilder: (context, index){
          return _sliderTile(keys[index], allOptions[keys[index]]);
        }
      );
    }



    //
    return ListView(

      children: <Widget>[

        if (sliderOptions != null) getSliderGroup(sliderOptions),
        getCheckBoxGroup(checkBoxOptions),
        SizedBox(
          height: 120,
        ),

      ],

    );


  }

}


