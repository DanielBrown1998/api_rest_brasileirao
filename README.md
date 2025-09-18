# Brasileirão Info App

Um aplicativo Flutter que exibe informações sobre campeonatos de futebol, com foco no Brasileirão, utilizando uma API REST.

## 🎯 Visão Geral

Este projeto demonstra a construção de um aplicativo Flutter multiplataforma (Android, iOS, Web, Desktop) seguindo princípios de Arquitetura Limpa. Ele consome dados de uma API de futebol para mostrar detalhes sobre campeonatos, times e tabelas de classificação.

## ✨ Recursos

- Visualização de campeonatos de futebol.
- Detalhes de times.
- Tabela de classificação do campeonato.
- Arquitetura Limpa para separação de responsabilidades.
- Injeção de dependência com `get_it`.
- Comunicação com API REST usando `http` e `dio`.

## 📂 Arquitetura do Projeto

O projeto é estruturado seguindo os princípios da Arquitetura Limpa para garantir que o código seja desacoplado, testável e de fácil manutenção.

```
lib/
├── data/
│   ├── repository/      # Implementações concretas dos repositórios
│   ├── services/        # Serviços de dados (API, banco de dados, etc.)
│   └── usecases/        # Implementações concretas dos casos de uso
│
├── domain/
│   ├── entities/        # Objetos de negócio da aplicação
│   ├── repository/      # Contratos (classes abstratas) dos repositórios
│   └── usecases/        # Contratos (classes abstratas) dos casos de uso
│
├── ui/
│   ├── championship/    # Widgets e lógica relacionados a campeonatos
│   ├── team/            # Widgets e lógica relacionados a times
│   └── home_page.dart   # Página inicial da aplicação
│
├── get_it_injection.dart  # Configuração da injeção de dependência
└── main.dart              # Ponto de entrada da aplicação
```

- **`domain`**: A camada mais interna. Contém a lógica de negócios principal e as entidades, sem depender de nenhuma outra camada.
- **`data`**: Camada que implementa os repositórios definidos na camada de `domain`. É responsável por buscar os dados de fontes externas (API, banco de dados).
- **`ui`**: A camada de apresentação. Contém os widgets do Flutter e gerencia o estado da interface do usuário, interagindo com a camada de `domain` através dos casos de uso.

## dependencies-chave

- **`flutter`**: Framework para construção da UI.
- **`http`** & **`dio`**: Clientes HTTP para realizar chamadas à API REST.
- **`get_it`**: Service Locator para injeção de dependências.
- **`flutter_bloc`**: (Embora `bloc` e `flutter_bloc` estejam nas dependências, o código atual não parece usá-los ativamente, a interação é feita via `FutureBuilder` ou `setState`. Pode ser um plano futuro).

## 🚀 Como Começar

Siga as instruções abaixo para configurar e executar o projeto localmente.

### Pré-requisitos

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (versão 3.9.0 ou superior)
- Um editor de código (ex: VS Code, Android Studio)

### Instalação e Execução

1.  **Clone o repositório:**
    ```sh
    git clone <URL_DO_SEU_REPOSITORIO>
    cd api_rest_brasileirao
    ```

2.  **Instale as dependências:**
    ```sh
    flutter pub get
    ```

3.  **Execute o aplicativo:**
    Selecione um dispositivo (emulador ou físico) e execute o comando abaixo.
    ```sh
    flutter run
    ```

---
*Este README foi gerado pela IA.*