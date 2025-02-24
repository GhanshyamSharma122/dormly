import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey=GlobalKey<FormState>();
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _priceController=TextEditingController();
  final TextEditingController _descriptionController=TextEditingController();
  final TextEditingController _contactNumberController=TextEditingController();
  final TextEditingController _contactDetailsController=TextEditingController();
  File? _image;
  final ImagePicker _picker=ImagePicker();
  Future<void> _pickImage() async{
    final pickedFile=await _picker.pickImage(source: ImageSource.gallery);
    if(pickedFile!=null){
      setState(() {
        _image=File(pickedFile.path);
      });
    }
  }
  void _submitForm(){
    if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product added Successfully!"))
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        backgroundColor: Colors.red,
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
      child:Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Product Name"),
                validator: (value)=>value!.isEmpty?"Enter product name":null,
              )
            ],
          ),
        ),
      )
      ),
    );
  }
}