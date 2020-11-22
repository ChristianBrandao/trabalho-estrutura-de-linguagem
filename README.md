# Linguagem de programação Dart #

## Desenvolvida pela Google, foi criada para construções de aplicativos em múltiplas plataformas. ##
&nbsp;

[[_TOC_]]

### Linha do tempo ###

&nbsp;

* 2011 - Dart foi apresentada
Pela Google na conferência 
GOTO em Aarhus, Dinamarca 

* 2013 - Influência pela linguagem Ruby, C, Java,
JavaScript, Smalltalk, c#, Kotlin, entre outros, 
Foi Lançada em 14 de Novembro pelos 
fundadores Larks Bak e Kasper Lund

* 2014 - Formado o comitê
Técnico TC52 para 
Trabalhar na padronização Do Dart

* 2015 -    Lançado a versão 
1.9 para compilar em
JavaScript

* 2018 - Lançado com mudança
de idioma e inclusão
de sistema de tipo

&nbsp;
## Paradigma de programação ##

&nbsp;

### Dart foi criada para trabalhar com vários estilos e suportar vários paradigmas de programação, portanto, a mesma é classificada com multiparadigma. ####

&nbsp;

![image](https://user-images.githubusercontent.com/47545253/99891801-aefec180-2c4c-11eb-9513-26cd9003ae9d.png)
&nbsp;



### Criada para uso em framework mobile flutter, desktop e servidores web. Uma linguagem moderna que mescla aspectos dinâmicos e estáticos conforme características abaixo. ###

&nbsp;

## Características: ##

###
• Possui sintaxe C-like, como Java e C

• Tipagem estática e fortemente tipada. Possui inferência de tipo, portanto, o tipo não precisa ser

declarado.

• Pode ser compilada em ahead-of-time (quando código é compilado pela ARM nativo)

• Poder ser compilada em just-in-time (quando é compilada diretamente no device, aplicação em

execução)

• Baseada em compilação JavaScript

• Tudo em Dart é um objeto

###

&nbsp;

## ASYNC - Programação assíncrona ( permitem que o programa conclua o trabalho enquanto espera a conclusão de outra operação ) ##

&nbsp;

```diff
Biblioteca **import** 'dart:async'

**Objeto Future:** Representa um cálculo cujo valor de retorno pode ainda não estar disponível. O Future retorna o

valor do cálculo quando for concluído em algum momento no futuro.

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

await Future.delayed(Duration(seconds:1));//programa espera a conclusão da tarefa em segundo plano em

deley de 1 seg

}

&nbsp;
```

**Link slide apresentacao** : https://docs.google.com/presentation/d/1goqsSyri_x9uyAsAjh3am3YpW_QhYiEnlWN6ICaB2Ng/edit?usp=sharing
