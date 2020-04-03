import 'package:flutter/material.dart';
import 'package:flutter_offers/ui/widget/sliver_app_bar_component.dart';

class ScrollableAppBar extends StatelessWidget {
  final List<dynamic> args;
  final TabController _companyTabController;
  ScrollableAppBar(this.args, this._companyTabController);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: args[2],
      expandedHeight: 200.0,
      elevation: 0.0,
      pinned: true,
      leading: IconButton(
        color: blackOrWhite(),
        padding: EdgeInsets.only(left: 6.0),
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: SliverAppBarComponent(
        hiddenChild: Row(
          children: <Widget>[
            Image.asset(args[1], scale: 4),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(args[0],
                  style: TextStyle(
                    color: blackOrWhite(),
                    fontSize: 20,
                  )),
            ),
          ],
        ),
        expandedChild: SizedBox(),
      ),
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Hero(
            tag: args[1],
            child: Image.asset(
              args[1],
              scale: 1.5,
            ),
          )),
      bottom: TabBar(
        unselectedLabelColor: blackOrWhite().withOpacity(0.56),
        labelColor: blackOrWhite(),
        isScrollable: true,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: blackOrWhite()),
            insets: EdgeInsets.symmetric(horizontal: 12.0)),
        tabs: [
          Tab(text: "Предложения"),
          Tab(text: "Подробнее"),
          Tab(text: "Локации"),
        ],
        controller: _companyTabController,
      ),
    );
  }

  Color blackOrWhite() => args[2] == Colors.white ? Colors.black : Colors.white;
}
