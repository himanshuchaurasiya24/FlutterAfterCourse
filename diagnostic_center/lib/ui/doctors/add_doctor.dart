import 'package:diagnostic_center/database/app_db.dart';
import 'package:diagnostic_center/ui/widgets/custom_text_form_widget.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDoctor extends StatefulWidget {
  const AddDoctor({super.key});

  @override
  State<AddDoctor> createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  final _doctorNameController = TextEditingController();
  final _doctorAddressController = TextEditingController();
  final _doctorPhoneNumberController = TextEditingController();
  final _doctorIncentiveController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _doctorNameController.dispose();
    _doctorAddressController.dispose();
    _doctorPhoneNumberController.dispose();
    _doctorIncentiveController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add a Doctor',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormWidget(
                      isString: true,
                      controller: _doctorNameController,
                      dataType: 'Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormWidget(
                      isString: true,
                      controller: _doctorAddressController,
                      dataType: 'Address',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormWidget(
                      isString: false,
                      controller: _doctorPhoneNumberController,
                      textInputType: const TextInputType.numberWithOptions(),
                      dataType: 'Phone Number',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormWidget(
                      isString: false,
                      controller: _doctorIncentiveController,
                      textInputType: const TextInputType.numberWithOptions(),
                      dataType: 'Incentive',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        final companion = DoctorModelCompanion(
                          doctorName: drift.Value(
                              _doctorNameController.text.toString()),
                          doctorAddress: drift.Value(
                              _doctorAddressController.text.toString()),
                          doctorPhoneNumber: drift.Value(
                              _doctorPhoneNumberController.text.toString()),
                          doctorIncentive: drift.Value(
                              _doctorIncentiveController.text.toString()),
                        );
                        if (_formKey.currentState!.validate()) {
                          Provider.of<AppDb>(context, listen: false)
                              .insertDoctor(companion)
                              .then((value) {
                            Navigator.pop(context, value);
                          });
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Doctor'),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
