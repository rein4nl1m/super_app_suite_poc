# suite_poc

POC para Super App: Unificação dos apps que se conversam.


## Funcionalidades
- Autenticação
- Navegação entre apps
- Navegação nos sub apps

## Estrutura do projeto

```
mpontom
│   
└─── android (estrutura de app android nativo)
│
└─── ios (estrutura de app ios nativo)
│
└─── lib
│   │
│   └─── src
│   │   │
│   │   └─── routes
│   │   │
│   │   └─── ui
│   │   │   │
│   │   │   └─── auth 
│   │   │   │
│   │   │   └─── home
│   │   │   │
│   │   │   └─── pages
│   │   │       
│   │   └─── routes
│   │   │       
│   │   └─── app.dart
│   │
│   └─── main.dart
│
└─── modules
    │
    └─── apps
    │   │
    │   └─── margem
    │   │
    │   └─── offerta
    │
    └─── core (apis, gerenciamento de estado, etc)
    │
    └─── dependencies (centralização de libs do projeto)
    │
    └─── shared (widgets, constantes e funções)
```

## Permissões do app

Por padrão, o usuário é criado somente com permissão do modulo principal e pode ser alterada pra exibir também o oferta.
