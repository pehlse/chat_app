import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);
  final Function({String text, File imageFile}) sendMessage;
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;

  TextEditingController _controler = TextEditingController();
  void _reset() {
    _controler.clear();

    setState(() {
      _isComposing = _controler.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () async {
              final File file = await ImagePicker.pickImage(source: ImageSource.camera);
              if(file == null) return;
              widget.sendMessage(imageFile: file);
            },
          ),
          Expanded(
            child: TextField(
              decoration:
                  InputDecoration.collapsed(hintText: 'Enviar uma mensagem'),
              controller: _controler,
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget.sendMessage(text:text);
                _reset();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing
                ? () {
                    widget.sendMessage(text: _controler.text);
                    _reset();
                  }
                : null,
          )
        ],
      ),
    );
  }
}
