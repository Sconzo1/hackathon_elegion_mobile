import 'package:e_legion_hackaton/app/todo/todo_providers.dart';
import 'package:e_legion_hackaton/app/todo/widgets/filter_chips.dart';
import 'package:e_legion_hackaton/app/todo/widgets/todo_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    var todosList = watch(todosListProvider);
    final firstFilter = watch(firstFilterProvider);
    final secondFilter = watch(secondFilterProvider);
    final thirdFilter = watch(thirdFilterProvider);
    final fourthFilter = watch(fourthFilterProvider);

    RefreshController _refreshController =
    RefreshController(initialRefresh: false);

    void _onRefresh(BuildContext context) async{

    }

    void _onLoading() async{
      // monitor network fetch
      await Future.delayed(Duration(milliseconds: 1000));
      // if failed,use loadFailed(),if no data return,use LoadNodata()
      
      _refreshController.loadComplete();
    }


    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 12, left: 12)),
          Center(
            child: Text(
              'Фильтры:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Filters(),
          ),
          todosList.when(
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, st) => Center(child: Text('Error: $error')),
            data: (data) => Expanded(
              child: SmartRefresher(
                enablePullDown: true,
                //enablePullUp: true,
                header: WaterDropHeader(),
                controller: _refreshController,
                onRefresh: () async {
                  await Future.delayed(Duration(milliseconds: 1000));
                  // if failed,use refreshFailed()
                  context.refresh(todosListProvider);
                  _refreshController.refreshCompleted();
                },
                onLoading: _onLoading,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    if (data[index].todoFilter == 1 && !firstFilter.state) // срочные (меньше 3 дней)
                      return Container();
                    if (data[index].todoFilter == 2 && !secondFilter.state) // redmine
                      return Container();
                    if (data[index].todoFilter == 3 && !thirdFilter.state) // не срочные
                      return Container();
                    if (data[index].todoFilter == -1 && !fourthFilter.state)  // выполненные
                      return Container();
                    return TodoListTile(todo: data[index]);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
