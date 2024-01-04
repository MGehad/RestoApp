import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/order.dart';
import '../../theme/app_color.dart';

class DeliveryConfirm extends StatefulWidget {
  final OrderData order;
  const DeliveryConfirm({super.key, required this.order});

  @override
  State<DeliveryConfirm> createState() => _DeliveryConfirmState();
}

class _DeliveryConfirmState extends State<DeliveryConfirm> {
  TextEditingController numController = TextEditingController();
  int selectedButtonIndex = 1;
  @override
  void initState() {
    super.initState();
  }

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm'),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 50),
          SegmentedButton(
              showSelectedIcon: false,
              style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity(horizontal: -1, vertical: -1),
              ),
              segments: const [
                ButtonSegment(
                    icon: Icon(Icons.nfc), value: 1, label: Text('NFC')),
                ButtonSegment(
                    icon: Icon(Icons.numbers), value: 2, label: Text('Code')),
              ],
              selected: {selectedButtonIndex},
              onSelectionChanged: (index) {
                setState(() {
                  selectedButtonIndex = index.first;
                });
              }),
          const SizedBox(height: 20),
          if (selectedButtonIndex == 1)
            Card(
              child: Container(
                width: 380,
                child: Column(children: [
                  const SizedBox(height: 20),
                  Text(
                    "Confirmation With NFC",
                    style: GoogleFonts.aladin(
                      color: AppColors.primaryColor,
                      fontSize: 25,
                    ),
                  ),
                  const Divider(height: 25),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'You can now hold your phone up to the device to confirm delivery!',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                      height: 150,
                      width: 150,
                      child: FittedBox(child: Icon(Icons.nfc_rounded))),
                  const Divider(height: 25),
                ]),
              ),
            ),
          if (selectedButtonIndex == 2)
            Card(
              child: Container(
                width: 380,
                child: Column(children: [
                  const SizedBox(height: 20),
                  Text(
                    "Confirmation Code:",
                    style: GoogleFonts.aladin(
                      color: AppColors.primaryColor,
                      fontSize: 25,
                    ),
                  ),
                  const Divider(height: 25),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: TextField(
                        controller: numController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Code'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'The customer needs to insert the above code to confirm receiving the order.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const Divider(height: 25),
                  FilledButton.icon(
                    icon: Icon(Icons.check),
                    label: const Text('Check And Confirm',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      if (numController.text =="111111") {
                        widget.order.deliveryStatus++;
                          if (context.mounted) {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    showCloseIcon: true,
                                    duration: Duration(seconds: 3),
                                    content: Text('Order Recieved.')));
                          }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                showCloseIcon: true,
                                duration: Duration(seconds: 3),
                                content:
                                    Text('Incorrect Confirmation Number.')));
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                ]),
              ),
            ),
        ],
      )),
    );
  }
}
