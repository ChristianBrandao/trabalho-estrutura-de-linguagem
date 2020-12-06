import 'package:dio/dio.dart';
import 'Post.dart';


//Future & Stream
//Programacao reativa
//Criar uma fonte de dados que gera uma sequência de elementos de dados de forma assíncrona.
//Exemplo prático e importante para Regra de negócio com a view (Web ou APP)
//Esse programa receber um API do IBGE, exibi todas as cidades (Microregião e Região) e mostra a quantidade de cidades

class HomeBloc {
  Dio dio = Dio(); //Objeto que faz chamada API
  Future<List<Post>> getPost(String url) async {
    //Definindo uma funcao Future da chamada API que retornada uma lista de posts
    Response response = await dio.get(
        url); //response recebe tipo json, foi utilizado await para que o programa continue até que seja feita toda chamada
    List<Post> list = (response.data as List)
        .map((item) => Post.fromJson(item))
        .toList(); //Cria uma novo type para os dados json e joga em uma nova lista
    return list;
  }

  Stream<List<Post>> getList(String url) async* { //Criando um gerador de Stream
    try {
      List<Post> posts = await getPost(url);
      yield posts; //Stream recebe dados da API
    } catch (e) {
      yield* null; //Caso ocorra um erro, recebera um stream de um stream  (que pode ser tratada de forma assíncrona)
    }
  }
}

void main()  async{
  final home = HomeBloc();
  String UF = "BA";
  //Abaixo foi usado Listen para ouvir os dados
  await home.getList("https://servicodados.ibge.gov.br/api/v1/localidades/estados/${UF}/municipios").listen((event) {
    for (var i in event) {
      print("Cidade: ${i.nome} - Microregiao: ${i.microrregiao.nome} - Regiao: ${i.microrregiao.mesorregiao.uF.regiao.nome}");
    }
  });
//Pode-se transformar os dados de uma Stream sem muita complexidade pela facilidade do controle
Stream<int> lista = home.getList("https://servicodados.ibge.gov.br/api/v1/localidades/estados/${UF}/municipios").map((event) => event.length);
 lista.listen((event) {print("Quantidade de cidades: ${event}");});
 
}
