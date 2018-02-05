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
