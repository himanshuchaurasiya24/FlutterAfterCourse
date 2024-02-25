import 'package:diagnostic_center/database/app_db.dart';
import 'package:diagnostic_center/models/center_name_provider.dart';
import 'package:diagnostic_center/ui/widgets/custom_text_form_widget.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateCenterInformation extends StatefulWidget {
  const UpdateCenterInformation({
    super.key,
    required this.centerName,
    required this.centerAddress,
    required this.centerEmail,
  });
  final String centerName;
  final String centerAddress;
  final String centerEmail;

  @override
  State<UpdateCenterInformation> createState() =>
      _UpdateCenterInformationState();
}

class _UpdateCenterInformationState extends State<UpdateCenterInformation> {
  @override
  void initState() {
    _centerNameController.text = widget.centerName;
    _centerAddressController.text = widget.centerAddress;
    _centerEmailController.text = widget.centerEmail;
    super.initState();
  }

  final _centerNameController = TextEditingController();

  final _centerAddressController = TextEditingController();

  final _centerEmailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Center Information',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormWidget(
                      controller: _centerNameController,
                      dataType: 'Center Name',
                      isString: true),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormWidget(
                      controller: _centerAddressController,
                      dataType: 'Center Address',
                      isString: true),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormWidget(
                      controller: _centerEmailController,
                      dataType: 'Center Email',
                      isString: true),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      final companion = CenterInformationModelCompanion(
                        centerName: drift.Value(
                          _centerNameController.text.toString(),
                        ),
                        centerAddress: drift.Value(
                          _centerAddressController.text.toString(),
                        ),
                        centerEmail: drift.Value(
                          _centerEmailController.text.toString(),
                        ),
                      );
                      Provider.of<AppDb>(context, listen: false)
                          .updateCenterInformation(companion)
                          .then((value) {
                        CenterNameProvider().updateInfo(
                            _centerNameController.text.toString(),
                            _centerAddressController.text.toString(),
                            _centerEmailController.text.toString());
                        Navigator.pop(context);
                      });
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Update Center Information'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
