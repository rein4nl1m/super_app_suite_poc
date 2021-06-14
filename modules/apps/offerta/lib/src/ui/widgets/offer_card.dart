import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          height: size.height * .4,
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
}
