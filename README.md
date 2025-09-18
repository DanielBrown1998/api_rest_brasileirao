# Brasileirão Info App

Um aplicativo Flutter que exibe informações em tempo real sobre campeonatos de futebol, com foco no Brasileirão, utilizando a API da [api-futebol.com.br](https://www.api-futebol.com.br/).

## 🎯 Visão Geral

Este projeto é um aplicativo Flutter multiplataforma (Android, iOS, Web, Desktop) que demonstra os princípios da Arquitetura Limpa. Ele consome dados de uma API de futebol para exibir detalhes sobre campeonatos, times e tabelas de classificação.

## ✨ Recursos

- **Visualização de Campeonatos:** Veja a lista dos principais campeonatos de futebol.
- **Tabela de Classificação:** Acompanhe a classificação dos times no campeonato selecionado.
- **Detalhes do Time:** Veja informações detalhadas sobre um time específico.
- **Arquitetura Limpa:** O projeto segue uma arquitetura robusta para garantir a separação de responsabilidades e a testabilidade.
- **Gerenciamento de Estado:** Utiliza `flutter_bloc` para um gerenciamento de estado eficiente e previsível.
- **Injeção de Dependência:** Usa `get_it` para desacoplar as dependências do projeto.
- **Configuração Segura:** Gerencia chaves de API de forma segura usando variáveis de ambiente com `flutter_dotenv`.

## 📸 Screenshots

*(Placeholder para screenshots do aplicativo)*

## 📂 Arquitetura do Projeto

O projeto é estruturado com base nos princípios da Arquitetura Limpa, dividindo o código em três camadas principais:

```
lib/
├── data/
│   ├── repository/      # Implementações concretas dos repositórios
│   ├── services/        # Serviços de dados (API, banco de dados)
│   └── usecases/        # Implementações concretas dos casos de uso
│
├── domain/
│   ├── entities/        # Objetos de negócio da aplicação
│   ├── repository/      # Contratos (classes abstratas) dos repositórios
│   └── usecases/        # Contratos (classes abstratas) dos casos de uso
│
├── ui/
│   ├── championship/    # Widgets e lógica de estado para campeonatos
│   ├── team/            # Widgets e lógica de estado para times
│   └── home/            # Página inicial e navegação principal
│
├── get_it_injection.dart  # Configuração da injeção de dependência
└── main.dart              # Ponto de entrada da aplicação
```

- **`domain`**: A camada mais interna e o núcleo do aplicativo. Contém a lógica de negócios, entidades e os contratos (interfaces) para os casos de uso e repositórios. Não depende de nenhuma outra camada.
- **`data`**: A camada que implementa os contratos definidos no `domain`. É responsável por buscar dados de fontes externas (API, banco de dados local, etc.) e transformar esses dados em entidades de domínio.
- **`ui`**: A camada de apresentação. Contém todos os widgets do Flutter, as telas e a lógica de apresentação (usando `flutter_bloc`). Ela interage com a camada `domain` através dos casos de uso para exibir os dados e capturar a entrada do usuário.

## dependencies-chave

- **`flutter`**: Framework para construir a interface do usuário.
- **`http`** & **`dio`**: Clientes HTTP para fazer chamadas à API REST.
- **`flutter_bloc`**: Para gerenciamento de estado, separando a lógica de negócios da UI.
- **`get_it`**: Service Locator para injeção de dependências.
- **`flutter_dotenv`**: Para carregar variáveis de ambiente de um arquivo `.env` de forma segura.

## 🚀 Como Começar

Siga as instruções abaixo para configurar e executar o projeto localmente.

### Pré-requisitos

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Um editor de código (VS Code, Android Studio, etc.)

### Instalação e Execução

1.  **Clone o repositório:**
    ```sh
    git clone https://github.com/DanielBrown1998/api_rest_brasileirao.git
    cd api_rest_brasileirao
    ```

2.  **Instale as dependências:**
    ```sh
    flutter pub get
    ```

3.  **Configure a Chave da API (via .env)**
    Este projeto utiliza a API da [api-futebol.com.br](https://www.api-futebol.com.br/) e gerencia as chaves de API usando um arquivo `.env` para maior segurança.

    a. Na raiz do projeto, crie um arquivo chamado `.env`.

    b. Adicione sua chave de API a ele:
    ```
    API_KEY="live_sua_chave_de_api_aqui"
    ```

    c. Certifique-se de que o arquivo `.env` está listado na seção `assets` do seu `pubspec.yaml`:
    ```yaml
    flutter:
      assets:
        - .env
    ```
    
    d. **IMPORTANTE:** Adicione `.env` ao seu arquivo `.gitignore` para garantir que suas chaves secretas não sejam enviadas ao seu repositório.

4.  **Execute o aplicativo:**
    O `main.dart` já está configurado para carregar as variáveis do `.env` na inicialização. Basta selecionar um dispositivo e executar:
    ```sh
    flutter run
    ```

## 🤝 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma *issue* ou enviar um *pull request*.

## 📄 Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.