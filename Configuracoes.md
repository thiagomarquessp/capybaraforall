# Algo chamado Geckodriver

Até a versão 3.0 do Selenium e versão 46 do Firefox é necessário utilizarmos o Geckodriver para que o browser venha a ser aberto, então temos que instalar antes de iniciar algum projeto da seguinte maneira:

```ruby
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install jq nodejs curl -qy
sudo npm install -g geckodriver
```

Para instalar o node no Mac é bem mais fácil:

```ruby
brew install node
```

Só para explicar, eu instalei o Node e através do Node eu instalei o geckodriver com -g para ele instalar de forma global e isso quer dizer que ele vai colocar o geckodriver exatamente onde ele deve estar.

Obs.: Usuários de Windows, o processo é parecido, instale o Node e no terminal ou no Cmder instale com os mesmos comandos npm Ok.

# Configuração do ambiente para automação.

Dado que estamos com **ruby** e o **geckodriver** instalado será necessário configurarmos o nosso ambiente de trabalho.

As bibliotecas no ruby são chamadas de **gems** e tudo que vamos precisar alguém pensou primeiro e criou uma gem e a comunidade da manutenção.

Pra começar um projeto, vamos precisar instalar uma gem chamada **bundler**, que servirá como gerenciador das gems e suas dependências através do nosso arquivo Gemfile (falarei mais abaixo).

Para instalar, basta rodar o seguinte comando:

```ruby
gem install bundler
```

Toda gem que eu precisar, antes de sair instalando de alegre, de uma olhada em no rubygems, que é o lugar onde as bibliotecas ficam disponíveis e isso é importante pra decidirmos qual versão vamos trabalhar. Quando procurarmos a gem que estamos querendo trabalhar, vai aparecer as versões, a forma de como ela deve ficar no Gemfile ou então a forma manual de instalação. Com isso devemos copiar e colar para que eu tenha o controle total das versões que estou trabalhando. Nós temos uma péssima mania de qualquer versão nova que sai, já saímos atualizando sem saber porque estamos instalando.

Dentro da raiz do seu projeto, crie um arquivo chamado Gemfile (exatamente desse jeito, sem extensão). A grosso modo, o Gemfile é um arquivo onde eu armazeno a coleção de gems que eu vou precisar para o meu projeto. Com ele não sou obrigado a instalar gem a gem na mão. [Aqui](https://tosbourn.com/what-is-the-gemfile/) tem uma boa explicação do que é e como deixá-lo mais eficaz e escalável, mas por hora vamos cria da seguinte maneira:

```ruby
source 'https://rubygems.org'

gem 'cucumber', '~> 3.1'
gem 'capybara', '~> 2.16', '>= 2.16.1'
gem 'selenium-webdriver', '~> 3.8'
```
Dessa maneira eu to deixando claro quais as versões que eu to trabalhando. O cucumber sofreu muitas mudanças da versão 2.4 pra versão 3 em diante. O objetivo desse refactory é justamente adaptar a essas novas mudanças.

Essas são as gems necessárias para um início de trabalho.

Cucumber será a base da nossa automação, utilizando Gherkin para escrita.

Capybara será o framework de desenvolvimento.

Selenium Webdriver será o Driver base e abrir o Firefox para automação.

Quando temos o Gemfile, podemos usar o bundler para instalar todas as gems e suas dependências, usando o seguinte comando:

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
support serve para colocarmos qualquer tipo de configuração para os nossos testes também .rb (assim como o arquivo env.rb, que possui configurações iniciais, gems a serem utilizadas para os testes, etc.).
```
Se vocês repararem quando o comando init é dado, um arquivo chamado env.rb é criado na pasta support e esse arquivo nada mais é que um arquivo de configuração para os testes, e nele deve conter TODAS as gems que você quer utilizar, antecedidos de um require e também alguma configuração específica para que TODA vez que eu rodar o comando cucumber, ele olhe nesse arquivo, verifica as gems e as configurações para poder seguir com o teste. Segue o exemplo que vamos utilizar:

```ruby
require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 60

Capybara.app_host = "https://www.flube.com.br/"
```
Onde, **require "gem a ser utilizada"** eu estou falando que para rodar esse projeto, eu estou utilizando essa gem.

**Capybara.register_driver** eu to informando que SIM, ele pode abrir o Firefox com o geckodriver :), porém, posso também passar o parâmetro :chrome mas isso não vai ser discutido aqui beleza.

**Capybara.default_driver = :selenium** (Defino o Driver que eu vou utilizar, no caso, Selenium Webdriver.

**Capybara.default_max_wait_time = 60** (Time out definido nesse caso, em 60 segundos, mas o valor você que estabelece).

**Capybara.app_host** eu coloco a url do produto que estou a trabalhar.

Dica: Pra ficar coerente, no arquivo env.rb coloque os require nas gems que tu informa no Gemfile, para não ter que colocar coisas a mais ou a menos.

Agora que temos o ambiente montado, devemos enteder algumas coisas. A primeira dela é como trabalhar com [arquivos de feature.](https://github.com/thiagomarquessp/capybaraforall/blob/master/Executando_seus_arquivos_Feature.md)
