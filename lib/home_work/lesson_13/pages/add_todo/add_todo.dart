import 'package:flutter/material.dart';

import '../../data/models/todo.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({
    required this.todo,
    Key? key,
  }) : super(key: key);

  final Todo? todo;

  static const routeName = '/add_todo';

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _formKey = GlobalKey<FormState>();

  late String _title;
  late String _content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.todo == null ? 'Thêm mới' : 'Chỉnh sửa',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: _formKey,
                onChanged: () {
                  debugPrint('Tiêu đề hoặc nội dung công việc đã thay đổi');
                },
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: null,
                      initialValue: widget.todo?.title,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tiêu đề công việc không được để trống';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: Color(0xFF262626),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Tiêu đề',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.2),
                        ),
                        fillColor: const Color(0xFFFAFAFA),
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Color(0xFF3797EF),
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: const Color(0xFF000000).withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: const Color(0xFF000000).withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: const Color(0xFF000000).withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.redAccent,
                            width: 1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Color(0xFF3797EF),
                            width: 1,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        debugPrint('Tiêu đề công việc đã thay đổi');
                      },
                      onSaved: (value) {
                        _title = value ?? '';
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      maxLines: null,
                      initialValue: widget.todo?.content,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nội dung công việc không được để trống';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                        color: Color(0xFF262626),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Nội dung',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.2),
                        ),
                        fillColor: const Color(0xFFFAFAFA),
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: const Color(0xFF000000).withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Color(0xFF3797EF),
                            width: 1,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: const Color(0xFF000000).withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: const Color(0xFF000000).withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.redAccent,
                            width: 1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Color(0xFF3797EF),
                            width: 1,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        debugPrint('Mật khẩu - onChanged: $value');
                      },
                      onSaved: (value) {
                        _content = value ?? '';
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pop(
                        context,
                        Todo(
                          title: _title,
                          content: _content,
                          isCompleted: widget.todo?.isCompleted ?? false,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Lưu',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
