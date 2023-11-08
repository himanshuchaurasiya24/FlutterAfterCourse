import 'package:flutter/material.dart';
import 'package:keep_notes/database_service.dart';
import 'package:keep_notes/update_user.dart';
// video stopped at 11:40 on truecoders pending edit functionality;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   List<Map<String , dynamic>> dataList = [];
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  void _saveData() async {
    final name = _nameController.text;
    final age = int.tryParse(_ageController.text)??0;
    int insertId = await SQFLite.insertUser(name, age);
    print(insertId);
    List<Map<String, dynamic>> updatedData=await  SQFLite.getData();
    setState(() {
      dataList= updatedData;
    });
    _nameController.text='';
    _ageController.text= '';
  }
  void _fetchUsers() async {
    List<Map<String , dynamic>> userList = await SQFLite.getData();
    setState(() {
      dataList= userList;
    });
  }
  void _delete(int docId) async {
 await SQFLite.deleteData(docId);
 List<Map<String, dynamic>> updatedData= await SQFLite.getData();
 setState(() {
   dataList= updatedData;
 });
  }
  void fetchData() async {
    List<Map<String, dynamic>> fetchedData= await SQFLite.getData();
    setState(() {
      dataList= fetchedData;
    });
  }
  @override
  void initState() {
    _fetchUsers();
    SQFLite.initWinDB();
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }
  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sqflite'),
      ),
      body: Center(
        
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Name'
                    ),
                  ),
                  TextFormField(
                    controller: _ageController,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: const InputDecoration(
                      hintText: 'Age'

                    ),
                  ),
                  ElevatedButton(onPressed: _saveData, child: const Text('Save Data',),),
                ],
              ),
               const SizedBox(
                height: 20,
              ),
              Expanded(
                child:dataList.isEmpty?const Text('No data to display')  : ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder:(context, index) {
                    return ListTile(
                      title: Text('Name: ${dataList[index]['name']}'),
                      subtitle: Text('Age: ${dataList[index]['age']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UpdateUser(userId:  dataList[index]['id']),),).then((value){
                                if(value==true){
                                  fetchData();
                                }
                                
                              });
                          }, icon: const Icon(Icons.edit_outlined),),
                           IconButton(onPressed: (){
                            _delete(dataList[index]['id']);
                          }, icon: const Icon(Icons.delete_outline, color: Colors.red,),),
                        ],
                      ),
                    );
                  },
                  ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}