import 'package:bloc_app/cubit/todo/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/favorite/favorite_state.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  void initState() {
    context.read<ToDoCubit>().fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<ToDoCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoite Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          BlocBuilder<ToDoCubit, ToDoState>(builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () => todoCubit.selectAll(), icon: Icon(Icons.select_all)),
                IconButton(onPressed: () => todoCubit.deselectAll(), icon: Icon(Icons.deselect)),
                Visibility(
                    visible: state.selectedFound,
                    child: IconButton(
                        onPressed: () {
                          // context.read<FavoriteBloc>().add(DeleteSelectedItems());
                          todoCubit.deleteSelected();
                        },
                        icon: const Icon(Icons.delete_outlined))),
              ],
            );
          })
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // context.read<FavoriteBloc>().add(FetchFavoriteData());
          todoCubit.fetchData();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: BlocBuilder<ToDoCubit, ToDoState>(
                // buildWhen: (p, c) => p.favList != c.favList,
                builder: (_, state) {
              switch (state.favListStatus) {
                case ListStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ListStatus.failure:
                  return const Center(
                    child: Text('Something went Wrong!'),
                  );
                default:
                  print(AppBar().preferredSize.height);
                  return state.favList.isEmpty
                      ? ListView(
                          children: [
                            SizedBox(height: (AppBar().preferredSize.height - MediaQuery.sizeOf(context).height)),
                            Center(child: Text('No Data Found!')),
                          ],
                        )
                      : ListView.builder(
                          itemCount: state.favList.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                                title: Text(state.favList[i].name),
                                leading: Checkbox(
                                    value: state.favList[i].isSelected,
                                    onChanged: (val) {
                                      // context.read<FavoriteBloc>().add(MarkSelect(index: i));
                                      todoCubit.markSelected(i);
                                    }),
                                trailing: IconButton(
                                    onPressed: () {
                                      // context.read<FavoriteBloc>().add(MarkFavorite(index: i));
                                      todoCubit.markFavorite(i);
                                    },
                                    icon: Icon(
                                      state.favList[i].isFavorite ? Icons.favorite : Icons.favorite_border,
                                      color: state.favList[i].isFavorite ? Colors.red : Colors.grey,
                                    )));
                          },
                        );
              }
            }))
          ],
        ),
      ),
    );
  }
}
