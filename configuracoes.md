# Configuração do ambiente para início dos trabalhos.

Dado que estamos com ruby instalado, será necessário configurarmos o nosso ambiente de trabalho. E para isso vamos ter que instalar em primeiro lugar uma gem chamada bundler, que servirá como gerenciador das gems através do nosso arquivo Gemfile (falarei mais abaixo). Para instalar, basta rodar o seguinte comando:

```ruby
gem install bundler
```
Após a instalação do bundler, vamos agora criar um arquivo chamado Gemfile (exatamente desse jeito, sem extensão específica) e no seu conteúdo deverá conter:

```ruby
source "https://rubygems.org"

gem "cucumber"
gem "capybara"
gem "selenium-webdriver"
```
Essas são as gems necessárias para um início de trabalho.

Cucumber será a base da nossa automação, utilizando Gherkin para escrita.

Capybara será o framework de desenvolvimento.

Selenium Webdriver será o Driver para automação.

Para entender o contexto do bundler basta entender que ele vai ler o arquivo Gemfile e vai procurar no rubygems as gems que eu citei e vai instalá-las com as suas dependências. O comando a seguir fara isso:

```ruby
bundle install
```
Com as gems já instaladas, agora sim vamos começar a trabalhar.

Na mesma pasta onde foi criado o arquivo Gemfile, vamos iniciar o nosso projeto com o seguinte comando:

```ruby
cucumber --init
```

Após o comando cucumber --init será criada a estrutura básica para início do desenvolvimento:

```ruby
create   features
create   features/step_definitions
create   features/support
create   features/support/env.rb
```
Eu gosto de trabalhar com duas pastas a mais, que seria cucumber e a pasta specifications e ficaria da seguinte maneira:

```ruby
cucumber
cucumber/features
cucumber/features/specifications
cucumber/features/step_definitions
cucumber/features/support
cucumber/features/support/env.rb
```
Eu gosto da pasta specifications para colocar dentro dela todas as minhas features. Mas pode-se criar quantas pastas você julgue necessário. É até recomendado se seu sistema for muito complexo, por exemplo, um e-commerce que tem Cadastro, Pagamento, Notificação, etc. E com isso você teria uma pasta dentro de specifications para cada frente, até mesmo para ter controle na hora de dar alguma manutenção.

Então vamos lá:

```ruby
specifications serve para colocar os arquivos .features;
step_definitions serve para colocar os arquivos de steps .rb;
support serve para colocarmos qualquer tipo de configuração para os nossos testes também .rb (assim como o arquivo env.rb, que possui configurações iniciais, gems a serem utilizadas para os testes, etc.). Geralmente se coloca arquivos de Page Objects dentro de support, arquivo de Hooks.
```
