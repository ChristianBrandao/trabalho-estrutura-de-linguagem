
import 'dart:async';
import 'package:dio/dio.dart';


Future main() async{ // Future declarado para informar uma função que retorna um valor futuro
  String URL = 'https://jsonplaceholder.typicode.com/posts'; //Obter dados da web
  Dio dio = new Dio(); //função DIO faz a requisição http
  print("Inico programa");
  print("Programa em execuçao 1");
  await dio.get(URL).then((Response){ //programa espera a conclusão da tarefa em segundo plano
  print(Response.data[0]['title']);
 
  });
  print("Programa em execuçao 2");
  print("Fim programa"); 
  await Future.delayed(Duration(seconds:1));//programa espera a conclusão da tarefa em segundo plano em deley de 1 seg
}
