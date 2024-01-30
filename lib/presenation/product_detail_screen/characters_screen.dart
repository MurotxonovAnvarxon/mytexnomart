

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../data/source/model/detail_model/product_detail_model.dart';

class CharactersScreen extends StatelessWidget {
  final List<PurpleCharacter> characters;
  // const CharactersScreen(this.characters, {super.key});
  CharactersScreen({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final elements = [];
    int n = characters.length;

    for(int i = 0; i<n; i++){
      int m = characters[i].characters?.length ?? 3;
      for(int j=  0; j<m; j++){
        elements.add({
          'group' : '${characters[i].name}',
          'name' : '${characters[i].characters?[j].name}',
          'value' : '${characters[i].characters?[j].value}',
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(width: 8,),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.close)),
          SizedBox(width: 8,),
          Text('Xususiyatlar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          Spacer(),
        ],
      ),
      body: Flexible(
          child: GroupedListView<dynamic, String>(
              elements: elements,
              groupBy: (element) => element['group'],
              groupSeparatorBuilder: (value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(value, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
              ),
              // useStickyGroupSeparators: true,
              itemBuilder: (context, element) {
                return Container(
                  height: 46,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      Text(element['name'].toString().length < 40 ? '${element['name']}' : '${element['name'].toString().substring(0, 30)}', overflow: TextOverflow.fade,),
                      SizedBox(width: 2,),
                      Expanded(child: Text('...................................................................................................', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey), )),
                      SizedBox(width: 2,),
                      Text(element['value'].toString().length < 30 ? '${element['value']}' : "${element['value'].substring(0, 20)}" , overflow: TextOverflow.fade)
                    ],
                  ),

                );
              })

      ),

    );
  }
}
