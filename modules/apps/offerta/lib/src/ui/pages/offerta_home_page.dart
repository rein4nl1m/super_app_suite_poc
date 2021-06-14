import 'package:flutter/material.dart';
import 'package:offerta/src/ui/pages/my_promos_list_page.dart';
import 'package:offerta/src/ui/pages/offer_list_page.dart';
import 'package:offerta/src/ui/pages/stores_list_page.dart';
import 'package:shared/shared.dart';

class OffertaHomePage extends StatefulWidget {
  const OffertaHomePage({Key? key}) : super(key: key);

  @override
  _OffertaHomePageState createState() => _OffertaHomePageState();
}

class _OffertaHomePageState extends State<OffertaHomePage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    _pageController.jumpToPage(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: offertaPrimaryColor),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Offerta Digital',
          style: TextStyle(color: offertaPrimaryColor),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          OfferListPage(),
          StoresListPage(),
          MyPromosListPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        iconSize: 30,
        unselectedFontSize: 9,
        selectedItemColor: offertaSecondaryColor,
        unselectedItemColor: offertaSecondaryColor600,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'Ofertas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Lojas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Minhas Promoções',
          ),
        ],
      ),
    );
  }

  Widget offerCard(Size size) {
    final defaultBorderRadius = BorderRadius.circular(4);
    return Container(
      margin: const EdgeInsets.all(10),
      child: Material(
        borderRadius: defaultBorderRadius,
        elevation: 6,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: size.width / 4,
          ),
          decoration: BoxDecoration(
            borderRadius: defaultBorderRadius,
          ),
          height: size.height * .3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: size.height * .12,
                width: size.width / 2,
                child: Placeholder(),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Nome do Produto\n',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: 'Desconto',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: offertaSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  primary: offertaSecondaryColor,
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Ativar oferta'),
                onPressed: () {},
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                  children: [
                    TextSpan(text: 'Validade da Oferta\n'),
                    TextSpan(text: '+ Validade da Oferta'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center get buildDescription {
    return Center(
      child: Column(
        children: description.map<Widget>((phrase) {
          return Text(
            phrase,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          );
        }).toList(),
      ),
    );
  }
}
