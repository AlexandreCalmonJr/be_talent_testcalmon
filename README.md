# 📊 Tabela Funcionários Be Talent - Flutter Dart

Este projeto exibe uma **tabela de usuários** com informações detalhadas sobre cada funcionário.  
Os dados são carregados via **API simulada** e podem ser filtrados dinamicamente com uma barra de pesquisa.  
Ao clicar na seta ao lado do nome, os detalhes do funcionário aparecem diretamente na tabela.

---

## 🚀 Funcionalidades

- ✅ **Listagem de usuários** com foto e nome  
- ✅ **Busca dinâmica** por nome  
- ✅ **Expansão de detalhes** do funcionário sem abrir outra tela  
- ✅ **Design responsivo e intuitivo**  
- ✅ **API simulada** para testes offline  

---

## 🛠️ Tecnologias utilizadas

- **Flutter** (Framework principal)
- **Dart** (Linguagem de programação)
- **Dio** (Para chamadas HTTP)
- **BLoC** (Para gerenciar estado)
- **Material Design** (Componentes visuais do Flutter)

---

## ⚙️ Pré-requisitos

Antes de começar, certifique-se de ter os seguintes itens instalados:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) ou [VS Code](https://code.visualstudio.com/)
- Emulador ou dispositivo físico configurado para rodar aplicativos Flutter
- [Node.js](https://nodejs.org/) (necessário para instalar o `json-server`)

---

## Instruções para Rodar a Aplicação

Siga os passos abaixo para executar o projeto em sua máquina:

### 1. Clonar o Repositório
Abra o terminal e execute o comando:

```bash
git clone https://github.com/AlexandreCalmonJr/be_talent_testcalmon.git
```

Entre na pasta do projeto:

```bash
cd be_talent_testcalmon
```

### 2. Instalar Dependências
Certifique-se de que o Flutter está configurado corretamente (rode `flutter doctor` para verificar). Em seguida, instale as dependências listadas no arquivo `pubspec.yaml`:

```bash
flutter pub get
```

### 3. Instalar o JSON Server
Para simular a API, você precisará instalar o `json-server`. Se você ainda não tem o Node.js instalado, faça o download e instale a partir do [site oficial](https://nodejs.org/).

Depois de instalar o Node.js, instale o `json-server` globalmente usando o npm:

```bash
npm install -g json-server
```

### 4. Iniciar o Servidor JSON
Para simular a API, use o json-server para servir o arquivo database.json. Certifique-se de estar dentro da pasta do projeto:


```bash
cd be_talent_testcalmon
json-server --watch database.json --port 3000
```

### 5. Configurar Dispositivo
Conecte um dispositivo físico ou inicie um emulador:

- **Android:** Use o Android Studio ou o comando `flutter emulators` para abrir um emulador.
- **iOS:** Use o Xcode para abrir o simulador (apenas em macOS).

Verifique os dispositivos disponíveis com:

```bash
flutter devices
```

### 6. Executar a Aplicação

No terminal, dentro da pasta do projeto, rode:

```bash
flutter run
```

Isso compilará o aplicativo e o abrirá no dispositivo/emulador selecionado.

### 7. Testar as Funcionalidades

- Navegue pela tabela de funcionários.
- Use a barra de pesquisa para filtrar por nome.
- Clique nas setas para expandir os detalhes de cada funcionário.

---

## Dicas Adicionais

- **Debugging:** Use `flutter run --debug` para rodar em modo de depuração e inspecionar erros.
- **API Simulada:** Como os dados são mockados, não é necessário configurar um servidor externo. Verifique o código (provavelmente em `lib/services` ou similar) para entender como os dados são gerados.
- **Customização:** Se quiser alterar o design ou adicionar mais dados, explore os arquivos em `lib/` (como `main.dart` e os widgets da tabela).