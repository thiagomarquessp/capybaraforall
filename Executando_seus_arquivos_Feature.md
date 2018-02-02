# Executando os trabalhos.

A primeira coisa a ser feita é escrever a feature a ser testada utilizando Gherkin como base na escrita, como por exemplo:

```ruby
Feature: Register

Scenario: Register on Automation Pratice   

Given I click on Sign in
When I fill in obligatory fields
Then my registration will be successfully made
```
Salvar o arquivo com extensão ".feature" na pasta specifications.

Ideal que a escrita da feature seja feita em inglês pelo simples fato que o uso dessa automação possa ser utilizada pelos POs, e de repente esse PO esteja nos Estados Unidos e o idioma nativo no caso, seria em inglês. Mas isso não é mandatório, podemos fazer nossas features em qualquer idioma, mas pra isso, será necessário no arquivo, na primeira linha colocar o seguinte comando:

```ruby
# language: pt
```
Com o arquivo.feature pronto, vamos para o nosso terminal executá-lo, então vamos navegar até a pasta cucumber:

```ruby
home/workspace/projeto/cucumber
```
Nesse caso, vamos executar o próprio comando cucumber:

```ruby
cucumber
```
O resultado será esse:

```ruby
Feature: Register

  Scenario: Register on Automation Pratice         # features/specifications/register.feature:3
    Given I click on Sign in                       # features/specifications/register.feature:5
    When I fill in obligatory fields               # features/specifications/register.feature:6
    Then my registration will be successfully made # features/specifications/register.feature:7

1 scenario (1 undefined)
3 steps (3 undefined)
0m0.007s

You can implement step definitions for undefined steps with these snippets:

Given(/^I click on Sign in$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I fill in obligatory fields$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^my registration will be successfully made$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
```
Traduzindo:

```ruby
Feature: Register

  Scenario: Register on Automation Pratice         # features/specifications/register.feature:3
    Given I click on Sign in                       # features/specifications/register.feature:5
    When I fill in obligatory fields               # features/specifications/register.feature:6
    Then my registration will be successfully made # features/specifications/register.feature:7

1 scenario (1 undefined)
3 steps (3 undefined)
0m0.007s

Ele executou linha a linha do seu arquivo.feature, onde ele encontrou um cenário com 5 passos de execução. O termo undefined quer dizer que ainda não foi implementado os testes para que esse inglês ou português estruturado possa realizar de fato as ações necessárias para o testes ser concluído;

You can implement step definitions for undefined steps with these snippets:

Given("I click on Sign in") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I fill in obligatory fields") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("my registration will be successfully made") do
  pending # Write code here that turns the phrase above into concrete actions
end

Esse é o resultado de cada passo a passo criado no arquivo.feature e vamos colocar na cabeça o seguinte:

1.Given, When, Then ("bla bla bla bla") do

end

Nada mais é que um método, mas de uma maneira mais amigável, fica simples entender o passo a passo apenas para esse pequeno contexto e dessa maneira é mais simples pensar em como devemos testar e com isso, colocar exatamente os comandos necessários para atender essa expectativa.
```
Muito bem, e agora, como implementar os testes?? Essa é a parte mais fácil e vamos ver no [próximo item.](https://github.com/thiagomarquessp/capybaraforall/blob/master/Criando_Steps_Definitions.md)
