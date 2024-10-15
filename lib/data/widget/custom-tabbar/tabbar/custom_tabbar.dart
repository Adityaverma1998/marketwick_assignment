import 'package:flutter/material.dart';

class CustomTabbarScreen extends StatefulWidget {

  final List<String> tabLists;
  final List<Widget> tabWidgets;


  const CustomTabbarScreen({super.key, required this.tabLists, required this.tabWidgets});

  @override
  State<CustomTabbarScreen> createState() => _CustomTabbarScreenState();
}

class _CustomTabbarScreenState extends State<CustomTabbarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int current = 0;
  PageController pageController = PageController();


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabLists.length, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      initialIndex: 0,
      length: widget.tabLists.length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            color: Theme.of(context).colorScheme.primary,
            height: 60,
            margin: EdgeInsets.only(bottom: 8.0,left: 0.0,right: 0.0),
            width: double.infinity,
            child: TabBar(
              // tabAlignment: TabAlignment.center,

              tabs: List.generate(
                widget.tabLists.length,
                    (index) => Tab(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Text(
                      widget.tabLists[index],

                    ),
                  ),
                ),
              ),
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: false, // Ensures that tabs do not scroll
              padding: EdgeInsets.zero,
              dividerHeight: 0,
              indicatorColor: Theme.of(context).primaryColor,
              labelPadding: EdgeInsets.zero,

              unselectedLabelColor: Color.fromRGBO(217, 217, 217, 0.9),
              labelColor:  Color.fromRGBO(217, 217, 217, 0.72),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              indicatorPadding: EdgeInsets.zero,
              labelStyle:  Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                // color: Colors.white,
                height: 1.3,
              ),

            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 8.0),
            height: MediaQuery.of(context).size.height * 0.7 ,
            child: TabBarView(

              controller: _tabController,
              children: [
                ...widget.tabWidgets,

              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
