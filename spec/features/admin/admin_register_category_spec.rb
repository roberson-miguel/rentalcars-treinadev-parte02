require 'rails_helper'

feature 'Admin register category' do
  scenario 'Successfully' do
    user = create(:user, role: :admin)

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias'
    click_on 'Criar Nova Categoria'
    fill_in 'Nome', with: 'A'
    fill_in 'Diária padrão', with: '88'
    fill_in 'Seguro padrão do carro', with: '20'
    fill_in 'Seguro padrão contra terceiros', with: '10'
    click_on 'Enviar'

    expect(page).to have_content ('Categoria criado com sucesso!')
    expect(page).to have_content 'Categoria: A'
    expect(page).to have_content('Diária padrão: 88')
    expect(page).to have_content('Seguro padrão do carro: 20')
    expect(page).to have_content('Seguro padrão contra terceiros: 10')
  
  end
end