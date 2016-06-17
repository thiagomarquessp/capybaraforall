# encoding: utf-8
Given(/^I access the Walmart site$/) do
  visit "https://www.walmart.com.br/"
end

When(/^I click on Register$/) do
  find(:css, '#topbar-signup-link').click
end

And(/^fill in the fields$/) do
  within_frame 'iframeLogin' do
    fill_in 'notifymeClientName', with: 'Capybara for All'
    fill_in 'email', with: 'emailcapybaraforall@gmail.com'
    fill_in 'cpfcnpj', with: '02962965202'
    fill_in 'phone', with: '1124435654'
    fill_in 'password', with: 'inicial1234'
    fill_in 'signupClientPwdCheck', with: 'inicial1234'
    find(:css, '#signupButtonSend').click
  end
end

And(/^click Cadastar$/) do
  within_frame 'iframeLogin' do
    find(:css, '#signupButtonSend').click
  end
end

Then(/^my registration will be successfully made$/) do
  page.has_css?('input.suggestion-search', :text => 'Capybara for All', :visible => true)
end
