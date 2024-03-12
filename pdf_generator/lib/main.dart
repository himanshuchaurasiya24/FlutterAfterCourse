import 'package:flutter/material.dart';
import 'package:pdf_generator/invoice_service.dart';
import 'package:pdf_generator/model.dart/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PdfInvoiceService service = PdfInvoiceService();
  List<Product> products = [
    Product("Membership", 9.99, 19),
    Product("Nails", 0.30, 19),
    Product("Hammer", 26.43, 19),
    Product("Hamburger", 5.99, 7),
  ];
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice Generator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final currentProduct = products[index];
                  return Row(
                    children: [
                      Expanded(child: Text(currentProduct.name)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                "Price: ${currentProduct.price.toStringAsFixed(2)} €"),
                            Text(
                                "VAT ${currentProduct.vatInPercent.toStringAsFixed(0)} %")
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  setState(() => currentProduct.amount++);
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                currentProduct.amount.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  setState(() => currentProduct.amount--);
                                },
                                icon: const Icon(Icons.remove),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
                itemCount: products.length,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("VAT"), Text("${getVat()} €")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Total"), Text("${getTotal()} €")],
            ),
            ElevatedButton(
              onPressed: () async {
                final data = await service.createInvoice(products);
                service.savePdfFile("invoice_$number", data);
                // service.createInvoice(soldProducts)
                number++;
              },
              child: const Text("Create Invoice"),
            ),
          ],
        ),
      ),
    );
  }

  getTotal() => products
      .fold(0.0,
          (double prev, element) => prev + (element.price * element.amount))
      .toStringAsFixed(2);

  getVat() => products
      .fold(
          0.0,
          (double prev, element) =>
              prev +
              (element.price / 100 * element.vatInPercent * element.amount))
      .toStringAsFixed(2);
}
