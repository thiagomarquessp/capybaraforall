# Executando os trabalhos.

A primeira coisa a ser feita é escrever a feature a ser testada utilizando Gherkin como base na escrita, como por exemplo:

```ruby
Feature: Register

Scenario: Register on Wal Mart   

Given I access the Walmart site
When I click on Register
And fill in the fields
And click Cadastar
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

  Scenario: Register on Wal Mart                   # features/specifications/register.feature:3
    Given I access the Walmart site                # features/specifications/register.feature:5
    When I click on Register                       # features/specifications/register.feature:6
    And fill in the fields                         # features/specifications/register.feature:7
    And click Cadastar                             # features/specifications/register.feature:8
    Then my registration will be successfully made # features/specifications/register.feature:9

1 scenario (1 undefined)
5 steps (5 undefined)
0m0.049s

You can implement step definitions for undefined steps with these snippets:

Given(/^I access the Walmart site$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click on Register$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

And(/^fill in the fields$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

And(/^click Cadastar$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^my registration will be successfully made$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
```
Traduzindo:

```ruby
Feature: Register

  Scenario: Register on Wal Mart                   # features/specifications/register.feature:3
    Given I access the Walmart site                # features/specifications/register.feature:5
    When I click on Register                       # features/specifications/register.feature:6
    And fill in the fields                         # features/specifications/register.feature:7
    And click Cadastar                             # features/specifications/register.feature:8
    Then my registration will be successfully made # features/specifications/register.feature:9

1 scenario (1 undefined)
5 steps (5 undefined)
0m0.049s

Ele executou linha a linha do seu arquivo.feature, onde ele encontrou um cenário com 5 passos de execução. O termo undefined quer dizer que ainda não foi implementado os testes para que esse inglês ou português estruturado possa realizar de fato as ações necessárias para o testes ser concluído;

You can implement step definitions for undefined steps with these snippets:

Given(/^I access the Walmart site$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click on Register$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^fill in the fields$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^click Cadastar$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^my registration will be successfully made$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Esse é o resultado de cada passo a passo criado no arquivo.feature e vamos colocar na cabeça o seguinte:

1.(/^bla bla bla bla bla$/) é uma RegEx (Expressão Regular), e por hora entendam que quando o seu teste for iniciado, ele vai ler esse trecho de palavras e vai entender o que deve ser feito e vai ser executado um trecho de código que veremos no arquivo Criando Steps Definitions. Para saber mais sobre RegEx, segue o link do Wikipedia: https://goo.gl/cXFPYK.
```
