require_relative "steps_helper"

def cria_especialidade_valida
  @especialidadevalida = {
    :Nome => "Clinico geral",
    :Descricao => "Atendimento geral"
  }

end

def cria_especialiade_invalida
  @especialidadeinvalida = {
    :Nome => nil,
    :Descricao => "teste"
    
  }
end

Quando("acesso a página de cadastro de especialidade") do
  visit "/especialidades/new"
end

Quando("faço o cadastro de uma especialidade") do
  cria_especialidade_valida
  fill_in "especialidade_Nome", :with => @especialidadevalida[:Nome]
  fill_in "especialidade_Descricao", :with => @especialidadevalida[:Descricao]
  find(:xpath, "/html/body/form/div[9]/input").click
endEntão("eu vou conseguir ver a nova especialidadecd") do
  visit "/especialidades/"
  page.find('td', text: @especialidadevalida[:Nome])
end

Quando("Tento cadastrar uma especialidade inválida") do
  especialidadeinvalida
  fill_in "especialiade_nome", :with => @especialidadeinvalida[:nome]
  fill_in "especialiade_Descricao", :with => @especialidadeinvalida[:cep]
  
  find(:xpath, "/html/body/form/div[9]/input").click
end

Então("Visualizei o erro do cadastro") do
  page.find('h2',  text: 'error')
end
