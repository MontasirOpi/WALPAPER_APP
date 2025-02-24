import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:walpaper_app/widgets/image_tile.dart';

class HomePage extends StatefulWidget {
  final Function(bool) afterScrollResult;
  const HomePage({super.key, required this.afterScrollResult});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        //result:false;
        if (_isVisible) {
          _isVisible = false;
          widget.afterScrollResult(_isVisible);
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        //Result:True;
        if (!_isVisible) {
          _isVisible = true;
          widget.afterScrollResult(_isVisible);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                snap: true,
                title: Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Suggested'),
                    Tab(text: 'Liked'),
                    Tab(text: 'Library'),
                  ],
                  indicatorColor: Colors.red,
                  indicatorWeight: 4,
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              //Tab-1
              MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return ImageTile(
                    index: index,
                    imageSource: 'https://picsum.photos/500/1000?random=$index',
                    extent: (index % 2) == 0 ? 300 : 150,
                  );
                },
              ),
              //Tab-2
              const SizedBox(),
              //Tab-3
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
