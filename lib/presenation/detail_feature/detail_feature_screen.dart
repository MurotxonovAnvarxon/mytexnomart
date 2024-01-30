import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytexnomart/presenation/home/home_bloc.dart';
import '../../data/source/model/detail_model/product_detail_model.dart';
import '../../data/source/remote/api_client.dart';
import '../../di/di.dart';

class DetailFeatureScreen extends StatefulWidget {
  List<PurpleCharacter> characters;

  DetailFeatureScreen({Key? key, required this.characters}) : super(key: key);

  @override
  State<DetailFeatureScreen> createState() => _DetailFeatureScreenState();
}

class _DetailFeatureScreenState extends State<DetailFeatureScreen> {
  final bloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc..add(HomeInitialEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(body: Center(child: Text('${widget.characters.length}')));
        },
      ),
    );
  }
}
