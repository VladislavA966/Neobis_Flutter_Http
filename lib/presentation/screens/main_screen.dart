import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:neobis_week_three/core/dio/dio_settings.dart';
import 'package:neobis_week_three/core/models/data_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<DataModel> data = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index].title ?? ''),
            subtitle: Text(data[index].body ?? ''),
          );
        },
      ),
    );
  }

  Future<void> getData() async {
    Dio dio = DioSettings().dio;
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    List<Map<String, dynamic>> responseData =
        List<Map<String, dynamic>>.from(response.data);

    data = responseData.map((item) => DataModel.fromJson(item)).toList();

    setState(() {});
  }


}
