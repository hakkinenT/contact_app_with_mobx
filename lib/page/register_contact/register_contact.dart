import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../data/controllers/form_validator_controller.dart';
import '../../data/controllers/my_contact_controller.dart';
import '../../utils/text_input_formatters/phone_number_formatter.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/form_label.dart';

class RegisterContactPage extends StatelessWidget {
  const RegisterContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => FormValidatorController(),
      child: const RegisterContact(),
    );
  }
}

class RegisterContact extends StatefulWidget {
  const RegisterContact({super.key});

  @override
  State<RegisterContact> createState() => _RegisterContactState();
}

class _RegisterContactState extends State<RegisterContact> {
  late FormValidatorController formController;
  late MyContactController contactController;
  late ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();

    formController =
        Provider.of<FormValidatorController>(context, listen: false);

    contactController =
        Provider.of<MyContactController>(context, listen: false);

    disposer = reaction((_) => contactController.saved, (saved) {
      if (saved) {
        contactController.restoreSavedFlag();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text("Contato salvo com sucesso!"),
              ),
            );
        });
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Contato"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const FormLabel(
            label: "Nome",
          ),
          const SizedBox(
            height: 8,
          ),
          NameInput(controller: formController),
          const SizedBox(
            height: 16,
          ),
          const FormLabel(
            label: "E-mail",
          ),
          const SizedBox(
            height: 8,
          ),
          EmailInput(controller: formController),
          const SizedBox(
            height: 16,
          ),
          const FormLabel(
            label: "Telefone Celular",
          ),
          const SizedBox(
            height: 8,
          ),
          CellphoneInput(controller: formController),
          const SizedBox(
            height: 16,
          ),
          Observer(builder: (_) {
            return RegisterButton(
              onPressed: formController.isValidate
                  ? () {
                      contactController.addContact(formController.contact);
                    }
                  : null,
            );
          }),
        ]),
      ),
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({
    super.key,
    required this.controller,
  });

  final FormValidatorController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onChanged: controller.contact.setName,
      validator: (_) => controller.validateName(),
      hintText: "John Doe",
      textInputAction: TextInputAction.next,
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
    required this.controller,
  });

  final FormValidatorController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onChanged: controller.contact.setEmail,
      validator: (_) => controller.validateEmail(),
      hintText: "johndoe@email.com",
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class CellphoneInput extends StatelessWidget {
  const CellphoneInput({
    super.key,
    required this.controller,
  });

  final FormValidatorController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onChanged: controller.contact.setCellphone,
      validator: (_) => controller.validateCellphone(),
      hintText: "(79) 9 9999-9999",
      textInputAction: TextInputAction.done,
      inputFormatters: [
        LengthLimitingTextInputFormatter(16),
        PhoneNumberFormatter(phoneType: PhoneType.cellphone)
      ],
      keyboardType: TextInputType.number,
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text("Cadastrar Contato"),
      ),
    );
  }
}
