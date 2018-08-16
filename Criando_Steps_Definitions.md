# Criando seu primeiro arquivo de Steps.

Agora que criamos nosso arquivo .feature com Gherkin, vamos pegar o resultado obtido para criar nosso arquivo de Steps e vamos dar o nome de register_steps.rb na pasta step_definitions:

```ruby
workspace\capybaraforall\cucumber\features\step_definitions\register_steps.rb
```
E aquele resultado vamos copiar e colar nesse arquivo e vai ficar assim:

```ruby
Given("I click on Sign in") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I fill in obligatory fields") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("my registration will be successfully made") do
  pending # Write code here that turns the phrase above into concrete actions
end
```

_**Se você reparou, cada Given/When/And/Then + RegEx tem um "do" e um "end" ou seja, Given/When/And/Then da início ao método que vamos desenvolver, "do" te da a prerrogativa (essa eu gastei o português) para início do desenvolvimento (ou colocar os comandos para serem executados) e o "end" finaliza o método. Então podemos concluir que dentro de um arquivo de steps eu tenho um método para cada passo do meu teste. E indo além, quando eu, em qualquer outro arquivo.feature escrever uma mesma frase: "I click on Sign in" eu não vou me preocupar em ter que desenvolver esse step de novo, porque ele já foi criado em algum lugar dentro de um método.**_

Bem .. arquivo criado, vamos ao que interessa, que é justamente dar vida ao nosso teste.

No lugar do "pending" vamos colocar os comandos necessários para execução dos passos do nosso teste. Vou listar aqui os comandos básicos para que possamos trabalhar dentro desse contexto.

Em outros artigos vou falar de técnicas mais específicas e com outros comandos, mas por hora pense que você está aprendendo e que precisa começar do zero, e se eu te passar um monte de comando, você vai se confundir e não vai entender, e fatalmente vai perder o interesse.

```ruby
visit "url do site" - Bom , não precisa falar muito dessa neh =)

fill_in ‘ID do elemento para inserir valor’, :with => “Aprendendo Capybara” – Irá inserir no elemento a string Aprendendo Capybara.

find(:id, “id do elemento”).click – Clica em um elemento definido por ID.
find(:css, “css do elemento”).click – Clica em um elemento definido por CSS.
find(:xpath, “xpath do elemento”).click – Clica em um elemento definido por XPATH.

all(:id, “id do elemento”)[0].click – Clica no primeiro elemento dentro de uma lista definido por ID.
all(:css, “css do elemento”)[0].click – Clica no primeiro elemento dentro de uma lista definido por CSS.
all(:xpath, “xpath do elemento”)[0].click – Clica no primeiro elemento dentro de uma lista definido por XPATH.

PS: Quando nos depararmos com um checkbox, radiobutton, utilizar da seguinte forma:

find(:radio_button, ‘nome do radiobutton’).set(true) – Nesse caso, ele vai selecionar aquele radiobutton.
find(:checkbox, ‘nome do checkbox’).set(true) – Nesse caso, ele vai selecionar aquele checkbox.

select ‘Nome do item no Drop Down’, from: ‘nome do elemento drop down’ – Seleciona um item de um drop down.
ex: select ‘Apto’, from ‘tipo_moradia’

click_button ‘Cadastrar’ –Clica no botão cadastrar.

click_link ‘Home’ – Clica no link Home caso haja algum na página.

expect(page).to have_content ‘Cadastro efetuado com sucesso’ – Procura a mensagem e caso tenha, será sucesso.

within_frame 'id do frame' do
  comandos de para interagir dentro do frame
end - Entra no Frame para continuar os testes.

page.has_css?('css do que vc quer validar na tela', :text => 'texto pra ser validado', :visible => true) - Olha o texto que está no elemento e ve se esse texto está visível.

```

Caso queira se aprofundar mais, olhem o [github](https://github.com/teamcapybara/capybara) do capybara.

# Forma de buscar um elemento:

Uma ferramenta de busca de elemento muito boa é o próprio inspecionar do Google Chrome, mas também tem o Firebug no Firefox, em ambos a forma de busca de elemento é a mesma. Eu vou passar aqui a forma via Jquery, mas tem outros seletores que tu podes usar OK. Bem, quando tu quiseres buscar um elemento, pense em saber como uma página html feita e abra essa página, clica com botão direto do mouse e vai em inspecionar elemento. Ele vai marcar o elemento em questão e vai ser algo mais ou menos assim:

```ruby
<a id="topbar-login-link" class="login-link topbar-buttons button-link topbar-login-js" href="">
```
No console do navegador, a forma mágica será: # para ID e . para classes (cerquilha para ID e ponto para classes), por exemplo, vou buscar o elemento do exemplo pelo ID:

```ruby
$('#topbar-login-link') e aquando eu dou enter:
[a#topbar-login-link.login-link.topbar-buttons.button-link.topbar-login-js, context: document, selector: "#topbar-login-link"]
```
Quando vc passar o mouse por cima do resultado, o elemento vai ficar em destaque, que te garante que o elemento  de fato o elemento que você quer trabalhar.

E se fosse pela classe do elemento:
```ruby
$('.login-link') e aquando eu dou enter:
[a#topbar-login-link.login-link.topbar-buttons.button-link.topbar-login-js, context: document, selector: "#topbar-login-link"]
```
Se o elemento que estiver em destaque for o que você realmente quer trabalhar, tu vai pegar o Id ou a classe e vai colocar nos comandos do capybara, por exemplo:

```ruby
Buscando pelo ID
find(:css, '#topbar-login-link').click

Buscando pela classe
find(:css, '.login-link').click
```
Então vamos aplicar:

Todo teste automatizado é derivado de uma ação manual feita em algum momento em algum lugar, então vamos lá acessar o arquivo register.rb e deixar o nosso código da seguinte maneira:

```ruby
Given("I click on Sign in") do
  visit '/index.php'
  click_link 'Sign in'
end

When("I fill in obligatory fields") do
  fill_in 'email_create', :with => 'learningcucumber01@test.com'
  click_button 'Create an account'
  find('#uniform-id_gender1').click
  fill_in 'customer_firstname', :with => 'Primeiro Nome'
  fill_in 'customer_lastname', :with => 'Sobrenome'
  fill_in 'passwd', :with => 'inicial1234'
  select '30', from: 'days'
  select 'January', from: 'months'
  select '1986', from: 'years'
  fill_in 'firstname', :with => 'Primeiro Nome Endereco'
  fill_in 'lastname', :with => 'Sobrenome Endereco'
  fill_in 'address1', :with => 'Rua dos Milagres'
  fill_in 'city', :with => 'Alabama Cidade'
  select 'Alabama', from: 'id_state'
  fill_in 'postcode', :with => '35007'
  fill_in 'phone_mobile', :with => '866-234-5382'
  fill_in 'alias', :with => 'Alias Exemplo'
  click_button 'Register'
end

Then("my registration will be successfully made") do
  page.has_content?('Welcome to your account. Here you can manage all of your personal information and orders.')
end

```
Finalizando, ir no terminal, navegar até a página cucumber e executar o próprio comando cucumber e ver a mágica acontecer e quando terminar o teste, você verá o seguinte resultado:

```ruby
Feature: Register

  Scenario: Register on Automation Pratice         # features/specifications/register.feature:3
    Given I click on Sign in                       # features/step_definitions/register.rb:1
    When I fill in obligatory fields               # features/step_definitions/register.rb:6
    Then my registration will be successfully made # features/step_definitions/register.rb:27

1 scenario (1 passed)
3 steps (3 passed)
0m15.603s
```
Onde todos os passos foram executados em 15 segundos. Tudo passou =) ... Coisa linda demais.

Esse é o princípio de tudo pessoal, conceitualmente a automação na camada de UI se resume apenas em: **Abrir Browser, Procurar Elemento, Interagir com Elemento, Fechar Browser.** e quando temos isso bem claro na nossa cabeça fica mais fácil e mais divertido automatizar os testes, pois são as mesmas ações que fazemos ao testar de forma manual, só que agora de forma automatizada.

Caso goste desse material, não deixem de ver o [Capybara For All - Parte II](https://github.com/thiagomarquessp/capybara_for_all_p2) e divirtam-se.
