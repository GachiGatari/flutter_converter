import 'package:flutter/material.dart';
void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter App',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final List<String> _quantities = ['Вес', 'Валюта', 'Температура', 'Длина', 'Площадь'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выберите величину'),
      ),
      body: ListView.builder(
        itemCount: _quantities.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_quantities[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConversionPage(quantity: _quantities[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ConversionPage extends StatefulWidget {
  final String quantity;

  ConversionPage({required this.quantity});

  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  String _fromValue = '';
  String _toValue = '';
  String _resultValue = '';
  double _inputValue = 0.0;
  late List<String> _availableValues;

  final TextEditingController _controller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.quantity == 'Вес') {
      _availableValues = ['Грамм', 'Килограмм', 'Пуд'];
      _fromValue = 'Грамм';
      _toValue = 'Килограмм';
    } else if (widget.quantity == 'Валюта') {
      _availableValues = ['USD', 'EUR', 'RUB'];
      _fromValue = 'USD';
      _toValue = 'EUR';
    } else if (widget.quantity == 'Температура') {
      _availableValues = ['Цельсий', 'Фаренгейт', 'Кельвин'];
      _fromValue = 'Цельсий';
      _toValue = 'Фаренгейт';
    } else if (widget.quantity == 'Длина') {
      _availableValues = ['Сантиметр', 'Метр', 'Километр'];
      _fromValue = 'Сантиметр';
      _toValue = 'Метр';
    } else if (widget.quantity == 'Площадь') {
      _availableValues = ['Кв.Метр', 'Кв.Километр', 'Гектар'];
      _fromValue = 'Кв.Метр';
      _toValue = 'Кв.Километр';
    }
  }

  void convert(double value) {
    double result = 0.0;
    print("Calculating");
    if (_fromValue == 'Грамм' && _toValue == 'Килограмм') {
      result = value / 1000;
    } else if (_fromValue == 'Грамм' && _toValue == 'Пуд') {
      result = value * 0.00220462;
    } else if (_fromValue == 'Килограмм' && _toValue == 'Грамм') {
      result = value * 1000;
    } else if (_fromValue == 'Килограмм' && _toValue == 'Пуд') {
      result = value * 2.20462;
    } else if (_fromValue == 'Пуд' && _toValue == 'Грамм') {
      result = value / 0.00220462;
    } else if (_fromValue == 'Пуд' && _toValue == 'Килограмм') {
      result = value / 2.20462;
    } else if (_fromValue == 'USD' && _toValue == 'EUR') {
      result = value * 0.93;
    } else if (_fromValue == 'USD' && _toValue == 'RUB') {
      result = value * 74.21;
    } else if (_fromValue == 'EUR' && _toValue == 'USD') {
      result = value * 1.07;
    } else if (_fromValue == 'EUR' && _toValue == 'RUB') {
      result = value * 79.57;
    } else if (_fromValue == 'RUB' && _toValue == 'USD') {
      result = value / 74.21;
    } else if (_fromValue == 'RUB' && _toValue == 'EUR') {
      result = value / 79.57;
    } else if (_fromValue == 'Цельсий' && _toValue == 'Фаренгейт') {
      result = (value * 9 / 5) + 32;
    } else if (_fromValue == 'Цельсий' && _toValue == 'Кельвин') {
      result = value + 273.15;
    } else if (_fromValue == 'Фаренгейт' && _toValue == 'Цельсий') {
      result = (value - 32) * 5 / 9;
    } else if (_fromValue == 'Фаренгейт' && _toValue == 'Кельвин') {
      result = (value + 459.67) * 5 / 9;
    } else if (_fromValue == 'Кельвин' && _toValue == 'Цельсий') {
      result = value - 273.15;
    } else if (_fromValue == 'Кельвин' && _toValue == 'Фаренгейт') {
      result = value * 9 / 5 - 459.67;
    } else if (_fromValue == 'Сантиметр' && _toValue == 'Метр') {
      result = value / 100;
    } else if (_fromValue == 'Сантиметр' && _toValue == 'Километр') {
      result = value / 100000;
    } else if (_fromValue == 'Метр' && _toValue == 'Сантиметр') {
      result = value * 100;
    } else if (_fromValue == 'Метр' && _toValue == 'Километр') {
      result = value / 1000;
    } else if (_fromValue == 'Километр' && _toValue == 'Сантиметр') {
      result = value * 100000;
    } else if (_fromValue == 'Километр' && _toValue == 'Метр') {
      result = value * 1000;
    } else if (_fromValue == 'Кв.Метр' && _toValue == 'Кв.Километр') {
      result = value / 1000000;
    } else if (_fromValue == 'Кв.Метр' && _toValue == 'Гектар') {
      result = value / 10000;
    } else if (_fromValue == 'Кв.Километр' && _toValue == 'Кв.Метр') {
      result = value * 1000000;
    } else if (_fromValue == 'Кв.Километр' && _toValue == 'Гектар') {
      result = value * 100;
    } else if (_fromValue == 'Гектар' && _toValue == 'Кв.Метр') {
      result = value * 10000;
    } else if (_fromValue == 'Гектар' && _toValue == 'Кв.Километр') {
      result = value / 100;
    }
    print("Result = " + result.toString());
    setState(() {
      _resultValue = result.toString();
    });
  }

  void onDefaultPress(String value){
    if(_controller.text.length == 8)
      return;

    if(value == "0"){
      _controller.text += "0";
    }
    else if(_controller.text == "0.0"){
      _controller.text = value;
    }
    else{
      _controller.text += value;
    }

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      convert(_inputValue);
    }
  }

  Widget buildButton(String buttonText, {Color buttonColor = Colors.blue, String type = "default"}){
    return ElevatedButton(
      onPressed: (){
        switch (type){
          case "dot":
            if(!_controller.text.contains("."))
              _controller.text += ".";
            break;
          default:
            return onDefaultPress(buttonText);
        }
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            CircleBorder()),
        fixedSize: MaterialStateProperty.all(const Size(65, 65)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states){
            if(states.contains(MaterialState.pressed)){
              return Colors.green;
            }
            return buttonColor;
          },
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 24),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quantity),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _controller,
                keyboardType: TextInputType.none,
                decoration: InputDecoration(
                  labelText: 'Enter a value',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста введите значение';
                  }
                  final number = double.tryParse(value);
                  if (number == null) {
                    return 'Пожалуйста введите число';
                  }
                  return null;
                },
                onSaved: (value) {
                  _inputValue = double.parse(value!);
                },
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  DropdownButton<String>(
                    value: _fromValue,
                    hint: Text('From'),
                    items: _availableValues.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _fromValue = value!;
                      });
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        convert(_inputValue);
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.swap_horiz),
                    onPressed: () {
                      setState(() {
                        final temp = _fromValue;
                        _fromValue = _toValue;
                        _toValue = temp;
                      });
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        convert(_inputValue);
                      }
                    },
                  ),
                  DropdownButton<String>(
                    value: _toValue,
                    hint: Text('To'),
                    items: _availableValues.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _toValue = value!;
                      });
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        convert(_inputValue);
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Результат: " + _resultValue,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 3.0
                          ),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(30.0) //                 <--- border radius here
                          ),
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _controller.text = "0.0";
                                      setState(() {
                                        _resultValue = "0.0";
                                      });
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.red)
                                          )
                                      ),
                                      fixedSize: MaterialStateProperty.all(const Size(147, 65)),
                                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (states){
                                          if(states.contains(MaterialState.pressed)){
                                            return Colors.green;
                                          }
                                          return Colors.blue;
                                        },
                                      ),
                                    ),
                                    child: Text(
                                      "C",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  buildButton("7"),
                                  buildButton("8"),
                                  buildButton("9"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  buildButton("4"),
                                  buildButton("5"),
                                  buildButton("6"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  buildButton("1"),
                                  buildButton("2"),
                                  buildButton("3"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => onDefaultPress("0"),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.red)
                                          )
                                      ),
                                      fixedSize: MaterialStateProperty.all(const Size(147, 65)),
                                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (states){
                                          if(states.contains(MaterialState.pressed)){
                                            return Colors.green;
                                          }
                                          return Colors.blue;
                                        },
                                      ),
                                    ),
                                    child: Text(
                                      "0",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                  buildButton(".", type: "dot"),
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
