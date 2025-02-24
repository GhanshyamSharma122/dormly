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
              ),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Price"),
                validator: (value)=>value!.isEmpty?"Enter price of Product":null,
              ),
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(labelText: "Description"),
                validator: (value)=>value!.isEmpty?"Enter description of Product":null,
              ),
              TextFormField(
                controller: _contactNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: "Contact Number"),
                validator: (value)=>value!.isEmpty?"Enter your Contact Number":null,
              ),
              TextFormField(
                controller: _contactDetailsController,
                decoration: InputDecoration(labelText: "Contact Details"),
                validator: (value)=>value!.isEmpty?"Enter your address":null,
              ),
              const SizedBox(height: 20,),
              _image!=null?Image.file(_image!,height: 150,width: 150,fit:BoxFit.cover):Text("No image selected"),
              ElevatedButton(onPressed: _pickImage, child: Text("Pick Product Image")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: _submitForm, child: Text("Submit"))
            ],
          ),
        ),
      )
      ),
    );
  }
}