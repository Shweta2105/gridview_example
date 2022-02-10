import 'package:flutter/material.dart';
import 'package:simple_gridview/main.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridViewNumberPage extends StatelessWidget {
  final numbers = List.generate(50, (index) => '$index');
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(MyApp.title),
          actions: [
            IconButton(
              onPressed: () {
                final double value = 0;
                controller.jumpTo(value);
              },
              icon: Icon(Icons.arrow_upward),
            ),
            IconButton(
              icon: Icon(Icons.arrow_downward),
              onPressed: () {
                final value = controller.position.maxScrollExtent;
                controller.jumpTo(value);
              },
            ),
          ],
        ),
        body: StaggeredGrid(numbers: numbers, controller: controller));
    // SimpleGrid(controller: controller, numbers: numbers));
  }
}

class StaggeredGrid extends StatelessWidget {
  const StaggeredGrid({
    Key? key,
    required this.numbers,
    required this.controller,
  }) : super(key: key);

  final List<String> numbers;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemBuilder: (context, index) {
        final item = numbers[index];

        return buildNumber(item);
      },
      staggeredTileBuilder: (index) => StaggeredTile.count(1, 1),
//(index)=> index % 7=0 ? StaggeredTile.count(2,2) : StaggeredTile.count(1,1)
//StaggeredTile.count(2, isEven ? 2:1)
//StaggeredTile.count(2,1)
//StaggeredTile.count(2,2)
      itemCount: numbers.length,
      controller: controller,
    );
  }
}

class SimpleGrid extends StatelessWidget {
  const SimpleGrid({
    Key? key,
    required this.controller,
    required this.numbers,
  }) : super(key: key);

  final ScrollController controller;
  final List<String> numbers;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      padding: EdgeInsets.all(4),
      controller: controller,
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        final item = numbers[index];

        return buildNumber(item);
      },
    );
  }
}

Widget buildNumber(String number) {
  return Container(
    padding: EdgeInsets.all(16),
    color: Colors.limeAccent,
    child: GridTile(
      // header: Text(
      //   'Header $number',
      //   textAlign: TextAlign.center,
      // ),
      child: Center(
        child: Text(
          number,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
          textAlign: TextAlign.center,
        ),
      ),
      footer: Text(
        'Footer $number',
        textAlign: TextAlign.center,
      ),
    ),
  );
}
