import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainListViewPerformance(),
    );
  }
}

class MainListViewPerformance extends StatelessWidget {
  const MainListViewPerformance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // CustomScrollView is used to optimize performance
        body: CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Placeholder(
            fallbackHeight: 200,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              debugPrint('Item $index');
              return Container(
                height: 150.0,
                color: Colors.primaries[index % Colors.primaries.length],
                child: FittedBox(
                  child: Text(index.toString()),
                ),
              );
            },
            childCount: 10000,
          ),
        ),
      ],
    )

        // Performance become really BAD when using ListView/GridView with very
        //large size of list items

        // ListView(
        //   children: [
        //     const Placeholder(
        //       fallbackHeight: 200,
        //     ),
        //     ListView.builder(
        //       physics: const NeverScrollableScrollPhysics(),
        //       shrinkWrap: true,
        //       itemCount: 10000,
        //       itemBuilder: (context, index) {
        //         debugPrint('Item $index');
        //         return Container(
        //           height: 150.0,
        //           color: Colors.primaries[index % Colors.primaries.length],
        //           child: FittedBox(
        //             child: Text(index.toString()),
        //           ),
        //         );
        //       },
        //     )
        //   ],
        // ),
        );
  }
}
