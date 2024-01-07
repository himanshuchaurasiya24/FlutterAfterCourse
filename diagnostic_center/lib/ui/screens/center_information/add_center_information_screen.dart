import 'package:diagnostic_center/database/app_db.dart';
import 'package:diagnostic_center/models/center_name_provider.dart';
import 'package:diagnostic_center/ui/widgets/custom_text_form_widget.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCenterInformation extends StatelessWidget {
  AddCenterInformation({super.key});

  final _centerNameController = TextEditingController();
  final _centerAddressController = TextEditingController();
  final _centerEmailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Center Information',
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
                          .insertCenterInformation(companion)
                          .then((value) {
                        CenterNameProvider().updateInfo(
                            _centerNameController.text.toString(),
                            _centerAddressController.text.toString(),
                            _centerEmailController.text.toString());
                      });
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Center Information'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
