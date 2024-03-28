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
      appBar: AppBar(
        title: const Text('Favoite Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
            return Visibility(
                visible: state.selectedList.isNotEmpty,
                child: IconButton(
                    onPressed: () {
                      context.read<FavoriteBloc>().add(DeleteSelectedItems());
                    },
                    icon: const Icon(Icons.delete_outlined)));
          })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                  buildWhen: (p, c) => p.favoriteList != c.favoriteList,
                  builder: (_, state) {
                    switch (state.listStatus) {
                      case ListStatus.loading:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ListStatus.failure:
                        return const Center(
                          child: Text('Something went Wrong!'),
                        );
                      default:
                        return ListView.builder(
                          itemCount: state.favoriteList.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                                title: Text(state.favoriteList[i].name),
                                leading: Checkbox(
                                    value: state.favoriteList[i].isSelected,
                                    onChanged: (val) {
                                      context.read<FavoriteBloc>().add(MarkSelect(index: i));
                                    }),
                                trailing: IconButton(
                                    onPressed: () {
                                      context.read<FavoriteBloc>().add(MarkFavorite(index: i));
                                    },
                                    icon: Icon(
                                      state.favoriteList[i].isFavorite ? Icons.favorite : Icons.favorite_border,
                                      color: state.favoriteList[i].isFavorite ? Colors.red : Colors.grey,
                                    )));
                          },
                        );
                    }
                  }))
        ],
      ),
    );
  }
}
