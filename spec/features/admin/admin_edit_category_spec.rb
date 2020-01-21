require 'rails_helper'

feature 'Admin Edit category' do
  scenario 'Successfully' do
    user = create(:user, role: :admin)
    category = create(:category, name: 'A', daily_rate: '88', car_insurance: '20', third_party_insurance:'30')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias'
    click_on 'A'
    click_on 'Editar'
    fill_in 'Nome', with: 'B'
    fill_in 'Diária padrão', with: '70'
    fill_in 'Seguro padrão do carro', with: '10'
    fill_in 'Seguro padrão contra terceiros', with: '10'
    click_on 'Enviar'

    expect(page).to have_content ('Categoria alterada com sucesso!')
    expect(page).to have_content 'Categoria: B'
    expect(page).to have_content('Diária padrão: 70')
    expect(page).to have_content('Seguro padrão do carro: 10')
    expect(page).to have_content('Seguro padrão contra terceiros: 10')
  
  end
end