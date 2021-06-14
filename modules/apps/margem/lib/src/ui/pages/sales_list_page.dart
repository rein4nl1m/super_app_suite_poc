import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class SalesList extends StatelessWidget {
  final VoidCallback backFunction;

  SalesList({required this.backFunction});

  List<DataColumn> get columnsPlaceholderList =>
      List.generate(3, (_) => DataColumn(label: Container()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: BackButton(
          onPressed: backFunction,
        ),
        iconTheme: IconThemeData(color: margemPrimaryColor),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Voltar para a lista',
          style: TextStyle(color: margemPrimaryColor),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: ToogleRadioButton(
              optionsList: ['Hoje', 'Dia', 'Mês', 'Ano'],
              onTap: (value) {},
            ),
          ),
          DataTable(
            columns: [
              DataColumn(
                label: Text(""),
              ),
              DataColumn(label: Text("Valor Vendido")),
              DataColumn(label: Text("Share")),
            ],
            rows: [],
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                DataTable(
                  headingRowHeight: 0,
                  columns: columnsPlaceholderList,
                  rows: sales.map<DataRow>((sale) {
                    String sold = sale.soldValue!.toStringAsFixed(2);
                    String share = sale.share!.toStringAsFixed(2);
                    return DataRow(
                      selected: false,
                      cells: [
                        DataCell(
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${sale.initialHour}"),
                                Text("${sale.finalHour}"),
                              ],
                            ),
                          ),
                        ),
                        DataCell(
                          Text("R\$ $sold"),
                        ),
                        DataCell(Text("$share%")),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
