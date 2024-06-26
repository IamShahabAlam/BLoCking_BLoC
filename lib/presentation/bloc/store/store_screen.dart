import 'package:bloc_app/bloc/store/store_bloc.dart';
import 'package:bloc_app/bloc/store/store_event.dart';
import 'package:bloc_app/bloc/store/store_state.dart';
import 'package:bloc_app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  void initState() {
    context.read<StoreBloc>().add(FetchProductsData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Screen'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: BlocBuilder<StoreBloc, StoreState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<StoreBloc>().add(FetchProductsData());
            },
            child: BlocBuilder<StoreBloc, StoreState>(
              builder: (context, state) {
                var itemList = state.searchedProducts.isEmpty ? state.products : state.searchedProducts;
                return state.storeStatus == StoreStatus.loading
                    ? const Center(child: CircularProgressIndicator())
                    : state.storeStatus == StoreStatus.failure
                        ? const Center(child: Text('Something went wrong'))
                        : Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                    child: TextFormField(
                                      onChanged: (value) => context.read<StoreBloc>().add(FilterSearch(searchedText: value)),
                                      decoration: const InputDecoration(hintText: 'Search title', border: OutlineInputBorder()),
                                      onTapOutside: (_) => FocusManager.instance.primaryFocus!.unfocus(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: state.searchedText.isNotEmpty && state.searchedProducts.isEmpty
                                      ? const Center(child: Text('Nothing found'))
                                      : ListView.builder(
                                          physics: const AlwaysScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: itemList.length,
                                          itemBuilder: (context, i) {
                                            var item = itemList[i];
                                            return Container(
                                              padding: const EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(12.0)),
                                              margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                                              alignment: Alignment.center,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                        color: Theme.of(context).colorScheme.primaryContainer,
                                                        borderRadius: BorderRadius.circular(12.0),
                                                        image: DecorationImage(image: NetworkImage(item.image!, scale: 0.5))),
                                                  ),
                                                  const SizedBox(height: 8.0),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      const Icon(Icons.star, color: Colors.yellow),
                                                      Text(item.rating!.rate.toString()),
                                                      const SizedBox(width: 10.0),
                                                      Text('(${item.rating!.count})'),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Chip(label: Text(item.category!), elevation: 5.0),
                                                      Text('Rs. ${item.price!.round()}'),
                                                    ],
                                                  ),
                                                  Text(item.title!,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                      textAlign: TextAlign.left),
                                                  const SizedBox(height: 10),
                                                  Text(item.description!,
                                                      style: const TextStyle(color: Colors.grey, overflow: TextOverflow.ellipsis), maxLines: 3),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                ),
                              ],
                            ),
                          );
              },
            ),
          );
        },
      ),
    );
  }
}
