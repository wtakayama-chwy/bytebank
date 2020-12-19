import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transference.dart';
import 'package:flutter/material.dart';

const _title = 'Appbar';
const _labelValue = 'Value';
const _hintValue = '0.00';
const _labelAccountNumber = 'Account Number';
const _hintAccountNumber = '0000';
const _textBtnConfirmation = 'Confirm';

class TransferenceForm extends StatefulWidget {
  final TextEditingController _fieldAccountNumberController =
      TextEditingController();
  final TextEditingController _fieldValueController = TextEditingController();

  void _createTransference(BuildContext context) {
    final int accountNumber = int.tryParse(_fieldAccountNumberController.text);
    final double value = double.tryParse(_fieldValueController.text);
    if (accountNumber != null && value != null) {
      final createdTransference = Transference(value, accountNumber);
      debugPrint('Creating transference');
      debugPrint('$createdTransference');
      Navigator.pop(context, createdTransference);
    }
  }

  @override
  State<StatefulWidget> createState() {
    return StateOfTransferenceForm();
  }
}

class StateOfTransferenceForm extends State<TransferenceForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: widget._fieldAccountNumberController,
                label: _labelAccountNumber,
                hint: _hintAccountNumber),
            Editor(
                controller: widget._fieldValueController,
                label: _labelValue,
                hint: _hintValue,
                icon: Icons.monetization_on),
            RaisedButton(
              child: Text(_textBtnConfirmation),
              onPressed: () => widget._createTransference(context),
            ),
          ],
        ),
      ),
    );
  }
}