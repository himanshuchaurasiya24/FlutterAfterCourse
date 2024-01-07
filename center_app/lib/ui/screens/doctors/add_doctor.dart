import 'package:center_app/services/app_db.dart';
import 'package:center_app/ui/widgets/custom_text_form_widget.dart';
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
    _doctorPhoneNumberController.dispose();
    _doctorAddressController.dispose();
    _doctorIncentiveController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Doctor',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormWidget(
                    emailController: _doctorNameController,
                    dataType: 'Doctor\'s name'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormWidget(
                    emailController: _doctorAddressController,
                    dataType: 'Doctor\'s address'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormWidget(
                    emailController: _doctorPhoneNumberController,
                    textInputType: const TextInputType.numberWithOptions(),
                    dataType: 'Doctor\'s phone number'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormWidget(
                    emailController: _doctorIncentiveController,
                    textInputType: const TextInputType.numberWithOptions(),
                    dataType: 'Doctor\'s incentive'),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    final companion = DoctorModelCompanion(
                      doctorName: drift.Value(
                        _doctorNameController.text.toString(),
                      ),
                      doctorAddress: drift.Value(
                        _doctorAddressController.text.toString(),
                      ),
                      doctorPhone: drift.Value(
                        _doctorPhoneNumberController.text.toString(),
                      ),
                      doctorsIncentive: drift.Value(
                        _doctorIncentiveController.text.toString(),
                      ),
                    );
                    if (_formKey.currentState!.validate()) {
                      Provider.of<AppDb>(context, listen: false)
                          .insertDoctor(companion)
                          .then((value) {
                        debugPrint(
                          value.toString(),
                        );
                      });
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Doctor'),
                ),
              ],
            )),
      ),
    );
  }
}
