import 'package:dio/dio.dart';
import 'Caso.dart';

//Esse programa faz integração de um projeto que faço parte kcbr e recebe os dados de forma assíncrona usando Stream
//Site que foi integrado via API https://kbcbr.herokuapp.com
//O mesmo trabalha com os dados de forma assíncrona de acordo com os novos casos inseridos em kbcbr

class HomeBloc {
  Dio dio = Dio(); //Objeto que faz chamada API
  Future<List<casos>> getPost(String url) async {
    //Definindo uma funcao Future da chamada API que retornada uma lista de posts
    Response response = await dio.get(
        url); //response recebe tipo json, foi utilizado await para que o programa continue até que seja feita toda chamada
    List<casos> list = (response.data as List)
        .map((item) => casos.fromJson(item))
        .toList(); //Cria uma novo type para os dados json e joga em uma nova lista
    return list;
  }
  Stream<List<casos>> getList(String url) async* { //Criando um gerador de Stream
    try {
      List<casos> posts = await getPost(url);
      yield posts; //Stream recebe dados da API
    } catch (e) {
      yield* null; //Caso ocorra um erro, recebera um stream de um stream  (que pode ser tratada de forma assíncrona)
    }
  }
}

void main()  async{
  final home = HomeBloc();
  String UF = "SC";
  //Abaixo foi usado Listen para ouvir os dados
  await home.getList("https://kbcbr.herokuapp.com/todosCasos").listen((event) {
    for (var i in event) {
      print("Titulo: ${i.titulo} - Descricao: ${i.texto} - Pontuacao: ${i.pontuacao}");
    }
  });
//Pode-se transformar os dados de uma Stream sem muita complexidade pela facilidade do controle
Stream<int> lista = home.getList("https://kbcbr.herokuapp.com/todosCasos").map((event) => event.length);
 lista.listen((event) {print("Quantidade de casos: ${event}");});
 
}
