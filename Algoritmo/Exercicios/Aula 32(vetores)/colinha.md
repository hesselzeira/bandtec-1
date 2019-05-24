# Vetores

    Um vetor é uma funcionalidade padrão de praticamente todas as linguagens modernas, que permite ao programador a criação de uma lista dinâmica, por exemplo:

```javascript
    var tarefas = [
        'limpar a casa',
        'dar comida aos gatos',
        'lavar a louça',
        'arrumar mochila'
    ]
```

## Acessando um item da lista

    Agora que sua lista está criada, e você quer acessar um de seus itens, utilize a sintaxe de colchetes [] para obter a informação, exemplo:

```javascript
alert(tarefas[0]);
```

    Você deve ter notado que o primeiro item tem o índice 0, e não o índice 1. A contagem segue o padrão:
    
```javascript
var tarefas = [
    'limpar a casa',        // Índice 0
    'dar comida aos gatos', // Índice 1
    'lavar a louça',        // Índice 2
    'arrumar mochila'       // Índice 3
                            // E por aí vai...
]
```

## Comprimento da lista

    Quero saber quantos itens tenho na minha lista, como fazer?
    Toda lista "nasce" com uma propriedade, a 'length', do inglês: comprimento.
    Para acessa-la, basta utilizar o seguinte comando:

```javascript
nome_da_sua_lista.length
```

    No caso da nossa lista de tarefas, o valor retornado será 4.

## Acessando o último item da lista:

    Lembra que o comprimento da lista é acessado por '.length' e os índices começam do 0?
    Imagine assim:
        Nossa lista de tarefas tem 4 itens, ou seja, começa do índice 0 e vai até o índice 3, que é equivalente ao comprimento - 1, e toda lista segue este padrão: O ultimo índice da mesma é igual ao comprimento - 1, exemplo:

```javascript
alert(tarefas[tarefas.length - 1])
// Será exibido o valor 'arrumar mochila', que no caso, é o último.
```

## Adicionando um novo item à minha lista

    Ok, tudo de fundamental aprendido, agora quero adicionar um novo item à minha lista, como faço?

    Assim como toda lista tem uma peculiaridade de comprimento, elas também vem com funções "embutidas", como por exemplo, a função push(), que lhe permite adicionar um novo item a sua lista, exemplo:

```javascript
tarefas.push('colocar lentes')
```

    Agora a lista de tarefas ficará assim:

```javascript
console.log(tarefas)
// Exibirá:
/*
    tarefas = [
        'limpar a casa',        // Índice 0
        'dar comida aos gatos', // Índice 1
        'lavar a louça',        // Índice 2
        'arrumar mochila',       // Índice 3
        'colocar lentes',       // Índice 4 (novo)
    ]
*/
```

### Checar item por item de uma lista

    É comum a necessidade de checar ou manipular item por item de uma lista.
    Exemplo:

    Você tem a sua lista de tarefas criada anteriormente e quer exibir cada um dos itens seguidos de uma quebra de linha, de forma manual, resolveu escrever o código de um por um:

```javascript
mensagem.innerHTML += `${tarefas[0]}<br>`
mensagem.innerHTML += `${tarefas[1]}<br>`
mensagem.innerHTML += `${tarefas[2]}<br>`
mensagem.innerHTML += `${tarefas[3]}<br>`
mensagem.innerHTML += `${tarefas[4]}<br>`
// E por ai vai... (Manual)
```

    Como você já deve ter notado, esta forma é muito ineficiente, repete código e não prevê a quantidade de itens de uma lista.
    
    Percebe que a única coisa que muda de uma lista para a outra é o índice, que é incrementado de um em um? É o mesmo comportamento encontrado ao utilizar o contador de um "for".

    Reescrevendo de maneira correta o código acima, foi utilizado o contador de um for, que a cada execução é incrementado em um, para percorrer toda a lista de tarefas e concatenar a mensagem anterior com a nova.

```javascript
    
// Contador inicia com o valor de 0, já que você pretende vizualizar a lista desde o primeiro item
// Enquanto o contador for menor que a quantidade de itens da lista, continuará executando o procedimento
// A cada fim de execução, incrementa em um o valor do contador
for(cont=0;cont<tarefas.length;cont++){
    // Div de mensagem
    mensagem.innerHTML += `${tarefas[cont]}<br>`
}

```