import 'package:flutter/material.dart';

void main() => runApp(const BMICalculatorApp());

class BMICalculatorApp extends StatefulWidget {
  const BMICalculatorApp({Key? key}) : super(key: key);

  @override
  State<BMICalculatorApp> createState() => _BMICalculatorAppState();
}

class _BMICalculatorAppState extends State<BMICalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark(),
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _currentWeightValue = 50.0;
  double _currentHeightValue = 160.0;
  String _selectedGender = 'Männlich';
  double _bmi = 0.0;

  void _calculateBMI() {
    final double heightInMeters = _currentHeightValue / 100;
    final double bmi = _currentWeightValue / (heightInMeters * heightInMeters);
    setState(() {
      _bmi = bmi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      
      appBar: AppBar(
       centerTitle: true,
        backgroundColor: Color.fromARGB(255, 68, 116, 204),
        title: const Text(
          'BMI-Rechner',
          style: TextStyle(color: Colors.black,),
          )
          ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedGender = 'Männlich';
                  });
                  },                
               
               
                
                child: Text('Mann'),
                style: ElevatedButton.styleFrom(
                  primary:
                      _selectedGender == 'Männlich' ? Colors.blue : Colors.grey,
                
                )
              ),
              
              SizedBox(width: 100),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedGender = 'Weiblich';
                  });
                },
                
                child: Text(
                  'Frau'
                  ),
                style: 
                ElevatedButton.styleFrom(
                  primary:
                      _selectedGender == 'Weiblich' ? Colors.pink : Colors.grey,
                ),
              ),
            ],
          ),
          
    //1 scale

     
        
          Container(    
            height: 25,
            width: 400,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 121, 130, 145),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
             
              borderRadius: BorderRadius.circular(10.0),
               gradient: const LinearGradient(
                colors: [
                  Colors.black,
                  Color.fromARGB(255, 76, 157, 233)
                ] 
                ),
                
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey ,
                    blurRadius: 2.0,
                    offset: Offset(2.0,2.0)
                  )
                ]
            ),
            child: Slider(
              value: _currentWeightValue,
              min: 20,
              max: 150,
              divisions: 150,
              label: _currentWeightValue.round().toString() + ' kg',
              onChanged: (double value) {
                setState(() {
                  _currentWeightValue = value;
                });
              },
            ),
          ),
    //Körpergewicht Text
          Text('Körpergewicht: ${_currentWeightValue.toStringAsFixed(1)} kg',
          style: TextStyle(fontSize: 20),
          ),
          
           //2 Scale 
           Container(
            height: 25,
            width: 400,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 121, 130, 145),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
         
              borderRadius: BorderRadius.circular(10.0),
               gradient: const LinearGradient(
                colors: [
                  Colors.black,
                  Color.fromARGB(255, 76, 157, 233)
                ] 
                ),
                
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey ,
                    blurRadius: 2.0,
                    offset: Offset(2.0,2.0)
                  )
                ]
            ),
            
            child:  Slider(
              value: _currentHeightValue,
              min: 100,
              max: 220,
              divisions: 120,
              label: _currentHeightValue.round().toString() + ' cm',
              onChanged: (double value) {
                setState(() {
                  _currentHeightValue = value;
                });
              },
            ),
          ),
          
         
          
           
          //Körpergröße Text
          Text('Körpergröße: ${_currentHeightValue.toStringAsFixed(1)} cm',
          style: TextStyle(fontSize: 22),
          ),
          ElevatedButton(
            onPressed: () {
              _calculateBMI();
            },
            child: Text('BMI berechnen')
          ),
      
          Text('Ihr BMI: ${_bmi.toStringAsFixed(2)}'),
    
      ],
      
      ),
    );
    
    
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.amber,
      child: const Placeholder());
  }
}
