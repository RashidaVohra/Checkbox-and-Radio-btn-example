import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Progs',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const CheckboxRadio(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CheckboxRadio extends StatefulWidget {
  const CheckboxRadio({Key? key}) : super(key: key);

  @override
  State<CheckboxRadio> createState() => _CheckboxRadioState();
}

class _CheckboxRadioState extends State<CheckboxRadio> {
  bool checkvalue0 = false;
  bool checkvalue1 = false;
  bool checkvalue2 = false;

  String selectedCheckResult = "";
  bool isFromReset = false;

  //int radioValue = -1;
  int _groupValue = -1;
  String selectedRadioResult = "";
  dynamic ans1 = "";
  dynamic ans2 = "";
  dynamic ans3 = "";

  TextEditingController text1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Checkbox And Radio Button Example"),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: text1,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Name',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Hobbies",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CheckboxListTile(
                value: checkvalue0,
                selected: checkvalue0,
                title: const Text("Reading"),
                onChanged: (value) {
                  setState(() {
                    checkvalue0 = value!;
                    //checkvalue1 = false;
                    //checkvalue2 = false;
                    selectedCheckResult;
                  });
                },
              ),
              CheckboxListTile(
                value: checkvalue1,
                selected: checkvalue1,
                title: const Text("Swimming"),
                onChanged: (value) {
                  setState(() {
                    checkvalue1 = value!;
                    //checkvalue0 = false;
                    //checkvalue2 = false;
                    selectedCheckResult;
                  });
                },
              ),
              CheckboxListTile(
                value: checkvalue2,
                selected: checkvalue2,
                title: const Text("Travelling"),
                onChanged: (value) {
                  setState(() {
                    checkvalue2 = value!;
                    //checkvalue0 = false;
                    //checkvalue1 = false;
                    selectedCheckResult;
                  });
                },
              ),
              Text(selectedCheckResult),
              const SizedBox(
                height: 10,
              ),
              // ElevatedButton(
              //   onPressed: _onReset,
              //   child: const Text("Reset"),
              // ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Gender",
                style: TextStyle(fontSize: 20),
              ),

              //Text(selectedRadioResult),
              _myRadioButton(
                title: "Male",
                value: 0,
                onChanged: (newValue) => setState(() => _groupValue = newValue),
              ),
              _myRadioButton(
                title: "Female",
                value: 1,
                onChanged: (newValue) => setState(() => _groupValue = newValue),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  print_details();
                },
                child: const Text("Submit"),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Name: $ans1",
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Hobbie: $ans2",
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Gender: $ans3",
              ),
            ],
          ),
        ),
      ),
    );
  }

  handleCheckboxValueChanged0(bool value) {
    setState(() {
      checkvalue0 = true;
      selectedCheckResult = "Reading";
    });
  }

  handleCheckboxValueChanged1(bool value) {
    setState(() {
      checkvalue1 = true;
      selectedCheckResult = "Swimming";
    });
  }

  handleCheckboxValueChanged2(bool value) {
    setState(() {
      checkvalue2 = true;
      selectedCheckResult = "Travelling";
    });
  }

  // handleRadioValueChange(int value) {
  //   setState(() {
  //     radioValue = value;
  //   });
  //   selectedRadioResult = "Radio" + value.toString() + "is selected";
  // }

  Widget _myRadioButton({required String title, int? value, onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }

  void _onReset() {
    setState(() {
      checkvalue0 = false;
      checkvalue1 = false;
      checkvalue2 = false;
      selectedCheckResult = "";
    });
  }

  // ignore: non_constant_identifier_names
  void print_details() {
    //Textfield program
    setState(() {
      var name = text1.text;
      ans1 = name;
    });
    //Checkbox program
    if (checkvalue0) {
      setState(() {
        ans2 = "Reading";
      });
    } else if (checkvalue1) {
      setState(() {
        ans2 = "Swimming";
      });
    } else if (checkvalue2) {
      setState(() {
        ans2 = "Travelling";
      });
    }
    //Multiple ans
    if (checkvalue0 && checkvalue1 && checkvalue2) {
      setState(() {
        ans2 = "Reading, Swimming and Travelling";
      });
    } else if (checkvalue1 && checkvalue2) {
      setState(() {
        ans2 = "Swimming, Travelling";
      });
    } else if (checkvalue2 && checkvalue0) {
      setState(() {
        ans2 = "Travelling, Reading";
      });
    } else if (checkvalue0 && checkvalue1) {
      setState(() {
        ans2 = "Reading, Swimming";
      });
    }

    //Radio Button program
    if (_groupValue == 0) {
      setState(() {
        ans3 = "Male";
      });
    } else if (_groupValue == 1) {
      ans3 = "Female";
    }
  }
}
