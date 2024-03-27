import 'package:bloc_app/bloc/favorite/favorite_bloc.dart';
import 'package:bloc_app/bloc/favorite/favorite_event.dart';
import 'package:bloc_app/bloc/favorite/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    context.read<FavoriteBloc>().add(FetchFavoriteData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoite Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: BlocBuilder<FavoriteBloc, FavoriteState>(builder: (_, state) {
            return ListView.builder(
              itemCount: state.favoriteList.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(state.favoriteList[i].name),
                  leading: Checkbox(
                      value: state.favoriteList[i].isSelected,
                      onChanged: (val) {
                        // context.read<FavoriteBloc>().add();
                      }),
                  trailing: IconButton(
                      onPressed: () {
                        // context.read<FavoriteBloc>().add();
                      },
                      icon: Icon(
                        state.favoriteList[i].isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: state.favoriteList[i].isFavorite ? Colors.red : Colors.grey,
                      )),
                );
              },
            );
          }))
        ],
      ),
    );
  }
}
