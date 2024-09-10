import 'dart:async';

import 'package:flutter/material.dart';

class SearchBarCommon extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onSearch;

  const SearchBarCommon({
    super.key,
    this.hintText = "Search",
    this.onSearch,
  });

  @override
  State<SearchBarCommon> createState() => _SearchBarCommonState();
}

class _SearchBarCommonState extends State<SearchBarCommon> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _controller,
        onChanged: (value) {
          if (_debounce?.isActive ?? false) _debounce!.cancel();
          _debounce = Timer(const Duration(milliseconds: 500), () {
            if (widget.onSearch != null) {
              widget.onSearch!(value);
            }
          });
        },
        onFieldSubmitted: (value) {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            if (widget.onSearch != null) {
              widget.onSearch!(value);
            }
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your search query";
          }
          return null;
        },
        style:
            Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Theme.of(context).hintColor),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          filled: true,
          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
