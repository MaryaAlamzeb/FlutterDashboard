import 'package:finance_dashboard/widgets/charts/investment_bar_chart.dart';
import 'package:finance_dashboard/widgets/tables/cashflow_table.dart';
import 'package:finance_dashboard/widgets/data/pie_chart_data.dart'
    as CustomPieData;
import 'package:finance_dashboard/widgets/data/cashflow_data.dart';
import 'package:flutter/material.dart';
import 'balance_card.dart';
import 'chart_card.dart';
import 'charts/income_expense_chart.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome Back, Murtaza 👋",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Admin Profile",
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),

              // Balance Cards
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    BalanceCard(
                      title: "Bank Balance",
                      amount: "\$200,000",
                      icon: Icons.account_balance,
                      color: Colors.purple,
                      percentageChange: "+5%",
                    ),
                    BalanceCard(
                      title: "Cash Balance",
                      amount: "\$100,000",
                      icon: Icons.attach_money,
                      color: Colors.blue,
                      percentageChange: "-2%",
                    ),
                    BalanceCard(
                      title: "Investment Balance",
                      amount: "\$50,000",
                      icon: Icons.trending_up,
                      color: Colors.orange,
                      percentageChange: "+3%",
                    ),
                    BalanceCard(
                      title: "Credit Card Balance",
                      amount: "\$1,000,000",
                      icon: Icons.credit_card,
                      color: Colors.red,
                      percentageChange: "+1%",
                    ),
                    BalanceCard(
                      title: "Total",
                      amount: "\$1,350,000",
                      icon: Icons.savings,
                      color: Colors.green,
                      percentageChange: "+10%",
                    ),
                  ],
                ),
              ),

              IncomeExpenseChart(),
              const SizedBox(height: 16),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ChartCard(
                      title: "Expenses",
                      chartData: CustomPieData.PieChartDataSource
                          .getExpenseChartData(),
                      labels: CustomPieData.PieChartDataSource.labels,
                      colors: CustomPieData.PieChartDataSource.colors,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: ChartCard(
                      title: "Income",
                      chartData:
                          CustomPieData.PieChartDataSource.getIncomeChartData(),
                      labels: CustomPieData.PieChartDataSource.labels,
                      colors: CustomPieData.PieChartDataSource.colors,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: ChartCard(
                      title: "Bank Balance",
                      chartData: CustomPieData.PieChartDataSource
                          .getBankBalanceChartData(),
                      labels: const ["ABC Bank", "CBA Bank", "BCA Bank"],
                      colors: const [
                        Colors.purple,
                        Colors.orange,
                        Colors.green
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Investment Evolution (Bar Chart)
              const Text("Investment Evolution",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              InvestmentBarChart(data: const [
                50000,
                75000,
                120000,
                150000,
                145000,
                160000,
                190000,
                150000,
                200000,
                210000,
                230000,
                250000
              ]),

              const SizedBox(height: 24),
              CashFlowTable(
                months: CashFlowData.months,
                data: CashFlowData.data,
              ),
            ],
          ),
        ));
  }
}
