# Target Sistemas   

## UI Requirements

- Um Campo de senha
- Um campo de texto para representar o Login
- Um Label descrito "PolíƟca de privacidade"

## Lgin Requirements

- Verificar e alertar se ambos os campos de Login e senha estão preenchidos.
   - O campo senha não pode ter menos que dois caracteres.
   - O campo senha não pode ter caracteres especiais, sendo apenas possível
informar 'a' até 'Z' e '0' até '9'.
- Ambos os campos não podem ultrapassar 20 caracteres.
- Ambos os campos não podem terminar com o caractere de espaço no final.
- Se ambas as informações estiveram preenchidas deve ir para a próxima tela.
- Ao tocar no label "Política de privacidade" uma página web direcionada para o
google.com.br deve ser aberta.

## Data to Test

user: admin
pass: admin

user: target
pass: target123

## References

Scalable Folder Structure for Flutter Applications <https://medium.com/flutter-community/scalable-folder-structure-for-flutter-applications-183746bdc320>

Flutter MVVM architecture using Dependency Injection (DI) + State Management + Repository Pattern <https://medium.com/@cesarmcferreira/flutter-mvvm-architecture-using-dependency-injection-di-state-management-repository-pattern-92a4ef6ddfc3>    

url_launcher <https://pub.dev/packages/url_launcher>

Fetch data from the internet <https://docs.flutter.dev/cookbook/networking/fetch-data>
