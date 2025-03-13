import 'package:flutter/material.dart';

class CashFlowTable extends StatelessWidget {
  final List<String> months;
  final List<List<String>> data;

  CashFlowTable({required this.months, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cash Flow",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.purple),
                    SizedBox(width: 4),
                    Text("Last Year", style: TextStyle(color: Colors.purple)),
                    SizedBox(width: 8),
                    Icon(Icons.more_vert, color: Colors.black54),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                columnWidths: {
                  0: FixedColumnWidth(180),
                  for (int i = 1; i <= months.length; i++)
                    i: const FixedColumnWidth(100),
                },
                border: TableBorder.symmetric(
                    inside: BorderSide(color: Colors.grey.shade300)),
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey.shade100),
                    children: [
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text("",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      ...months.map((month) => TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                month,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                    ],
                  ),
                  ...List.generate(data.length, (index) {
                    return TableRow(
                      decoration: BoxDecoration(
                        color: index.isEven ? Color(0xFFF6F4FF) : Colors.white,
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              [
                                "Total Income",
                                "Total Expenses",
                                "Initial Bank Balance",
                                "Final Bank Balance",
                                "Movement on Investments",
                                "Net Cash Flow"
                              ][index],
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        ...data[index].map((value) => TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.grey.shade600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
