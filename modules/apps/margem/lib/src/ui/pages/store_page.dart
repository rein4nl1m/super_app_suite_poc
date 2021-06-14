import 'package:flutter/material.dart';
import 'package:margem/src/ui/pages/data_analysis_panel.dart';
import 'package:margem/src/ui/pages/resume_page.dart';
import 'package:margem/src/ui/pages/sales_list_page.dart';
import 'package:shared/shared.dart';

class StorePage extends StatefulWidget {
  StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  PageController _pageController = PageController();

  void navigateTo(Widget page) {
    Navigator.of(context).push(
      SharedNavigation.rightToLeftTransition(
        page: page,
      ),
    );
  }

  void animateTransition(int pageNumber) {
    _pageController.animateToPage(
      pageNumber,
      duration: Duration(milliseconds: 600),
      curve: Curves.ease,
    );
  }

  void backInitial() => _pageController.animateToPage(
        0,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home_outlined),
          onPressed: () {
            print('Lojas');
          },
        ),
        centerTitle: true,
        title: Text("Sua Loja 03"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                SharedNavigation.rightToLeftTransition(page: ResumePage()),
              );
            },
          ),
        ],
        bottom: calendarBottomAppBar,
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ListView(
            children: [
              ListTile(
                title: Text('Resumo da Loja'),
                leading: Icon(Icons.notes),
                onTap: () => navigateTo(ResumePage()),
              ),
              ListTile(
                title: Text('Lista de Vendas'),
                leading: Icon(Icons.savings),
                onTap: () => animateTransition(1),
              ),
              ListTile(
                title: Text('Analise Diária'),
                leading: Icon(Icons.pie_chart_outlined),
                onTap: () => animateTransition(2),
              ),
            ],
          ),
          SalesList(backFunction: backInitial),
          DailyAnalysisPanel(backFunction: backInitial),
        ],
      ),
    );
  }

  PreferredSize get calendarBottomAppBar {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight / 2),
      child: Container(
        height: kToolbarHeight / 2,
        width: MediaQuery.of(context).size.width * .6,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.only(right: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: weekdayTagColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: calendarTagColor,
              ),
              child: IconButton(
                iconSize: 16,
                color: Colors.white,
                icon: Icon(
                  Icons.calendar_today_outlined,
                ),
                onPressed: () {},
              ),
            ),
            Text(
              DateTime.now().dateFormatted,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
            Text(
              DateTime.now().weekdayInFull,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
