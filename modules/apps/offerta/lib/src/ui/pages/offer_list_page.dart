import 'package:flutter/material.dart';
import 'package:offerta/src/ui/widgets/offer_card.dart';
import 'package:shared/shared.dart';

class OfferListPage extends StatelessWidget {
  const OfferListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(8), child: buildDescription),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              'Ofertas em destaque',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: offertaSecondaryColor,
              ),
            ),
          ),
          Column(
            children: List.generate(
              20,
              (_) => OfferCard(),
            ),
          ),
        ],
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
