import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../../../../../core/data/models/language/language.dart';
import '../../../../../core/di/injector.dart';
import '../manager/language_bloc.dart';

class AdminLanguageDetail extends StatefulWidget {
  final Language? language;
  const AdminLanguageDetail({this.language, super.key});

  @override
  AdminLanguageDetailState createState() => AdminLanguageDetailState();
}

class AdminLanguageDetailState extends State<AdminLanguageDetail> {
   final TextEditingController _nameController= TextEditingController();
   final TextEditingController _codeController= TextEditingController();
   final TextEditingController _localeController= TextEditingController();
   final TextEditingController _imageController= TextEditingController();
  bool isActive = true;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.language?.name ?? "";
    _codeController.text = widget.language?.code ?? "";
    _localeController.text = widget.language?.locale ?? "";
    _imageController.text = widget.language?.image ?? "";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _localeController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text((widget.language == null) ? "Add language" : " language: ${widget.language?.name}"),
    actions: const [],
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                widget.language != null
                    ? IconButton(
                  onPressed: () => _onTapDelete(widget.language!.id),
                  icon: const Icon(
                    Icons.delete_forever,
                  ),
                )
                    : const SizedBox.shrink(),
              ],
            ),
            Row(children: [
              const Text("is Active:"),
              Switch(
                  value: isActive,
                  onChanged: (value) {
                    setState(() {
                      isActive = value;
                    });
                  })
            ]),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _codeController,
              decoration: const InputDecoration(labelText: 'Code'),
            ),
            TextField(
              controller: _localeController,
              decoration: const InputDecoration(labelText: 'Locale'),
            ),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(labelText: 'Image'),
            ),
            ElevatedButton(
              onPressed: () {
                final  language= Language(
                  id:0,
                  name: _nameController.text,
                  code: _codeController.text,
                  locale: _localeController.text,
                  image: _imageController.text,
                  status: isActive,

                );
                // widget.onSubmit(category);
                injector<LanguageBloc>().add(LanguageSaveEvent(language));
                context.pop();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    ),
    );
  }

  void _onTapDelete(int languageId) {
    injector<LanguageBloc>().add(LanguageDeleteEvent(languageId: languageId));
    context.pop();
  }
}
