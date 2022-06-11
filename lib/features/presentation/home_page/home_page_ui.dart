import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page_logic.dart';

class HomePageUi extends StatelessWidget {
  static const String PATH = '/home_page';
  final logic = Get.find<HomePageLogic>();
  final state = Get.find<HomePageLogic>().state;

  @override
  Widget build(BuildContext context) {
    final _widgetOptions = [
      HomeWidget(),
      createWidget()
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Maos'),
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.create),
                label: 'Create',
              ),
            ],
            currentIndex: state.selectedIndex.value,
            onTap: logic.onItemTapped,
          );
        },
      ),
      body: Obx(() {
        return _widgetOptions.elementAt(state.selectedIndex.value);
      }),
    );
  }

  Widget HomeWidget() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: state.news.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Wrap(
              children: [
                Text(
                  state.news[index]['title'].toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  state.news[index]['desc'].toString(),
                  style: TextStyle(fontSize: 14, height: 1.5),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
  Widget createWidget(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Text('Create news'),
    );
  }
}
