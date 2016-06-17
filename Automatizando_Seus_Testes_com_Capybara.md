# Capybara para Todos.

Automatizando seus testes com capybara. Parte I.

Bom dia pessoal, vou começar a escrever sobre testes automatizados já colocando o "projeto" disponível para aplicação dos testes no dia a dia de cada um. Como eu não muita paciência para ficar mantendo um blog, o github será o canal principal de minhas postagens.

Bom, eu vou descorrer o assunto de uma forma bem simples.

Antes de mais nada vamos a configuração do ambiente:

Windows:

Necessário: rubyinstaller (http://rubyinstaller.org/downloads/).

Obs.: Quando se instala o ruby, será necessário a instalação do DevKit correspondente da versão que você instalou.

Mac:

Necessário: Baixar o Xcode pelo link: https://developer.apple.com/xcode/downloads/. Aprendi que sempre que instalar o SO, a primeira coisa será instalar o Xcode.

Bem, depois do Xcode, vamos baixar o Homebrew via terminal com o comando:

```ruby
ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)” .
```

Para explicar o que é o homebrew basta dizer: “O Homebrew instala as coisas que você precisa que a Apple não forneceu para você.” - fonte: http://brew.sh/index_pt-br.html. Ou seja, é um gerenciador de pacotes.

Reinicie a máquina (isso mesmo, para “completar as instalações”).

Com o Homebrew instalado, será necessário instalar o “Qt” - Framework multiplataforma para desenvolvimento de interfaces gráficas - fonte: (http://pt.wikipedia.org/wiki/Qt) e serve basicamente para podermos utilizar o selenium como driver padrão de execução para os testes. Para instalar o Qt, é bem simples:

```ruby
brew install qt
```
