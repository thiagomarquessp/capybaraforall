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
Eu gosto de trabalhar com duas pastas a mais, que seria cucumber e a pasta specifications.
