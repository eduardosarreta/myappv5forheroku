# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
url_deputy = "http://meucongressonacional.com/api/001/deputado"
parsed_data_deputy = JSON.parse(open(url_deputy).read)
parsed_data_deputy.each do |x|
  a = Deputy.new
  a.id = x["id"].to_i
  a.name = x["nomeParlamentar"]
  a.party = x["partido"]
  a.sex = x["sexo"]
  a.state = x["uf"]
  a.telephone = x["telefone"]
  a.email = x["email"]
  a.picture = x["fotoURL"]
  a.expenses = x["gastoTotal"]
  a.save
end

url_senator = "http://meucongressonacional.com/api/001/senador"
parsed_data_senator = JSON.parse(open(url_senator).read)
parsed_data_senator.each do |x|
  a = Senator.new
  a.id = x["id"].to_i
  a.name = x["nomeParlamentar"]
  a.party = x["partido"]
  a.sex = x["sexo"]
  a.state = x["uf"]
  a.telephone = x["telefone"]
  a.email = x["email"]
  a.picture = x["fotoURL"]
  a.expenses = x["gastoTotal"]
  a.save
end

State.create!([{name:"AC"},{name:"AL"},{name:"AP"},{name:"AM"},{name:"BA"},{name:"CE"},{name:"DF"},{name:"ES"},{name:"GO"},{name:"MA"},{name:"MT"},{name:"MS"},{name:"MG"},{name:"PA"},{name:"PB"},{name:"PR"},{name:"PE"},{name:"PI"},{name:"RJ"},{name:"RN"},{name:"RS"},{name:"RO"},{name:"RR"},{name:"SC"},{name:"SP"},{name:"SE"},{name:"TO"}])

Party.create!([{name:"PSB"},{name:"DEM"},{name:"PRB"},{name:"PDT"},{name:"PMDB"},{name:"PR"},{name:"PT"},{name:"PP"},{name:"PSDB"},{name:"PCdoB"},{name:"PTB"},{name:"PPS"},{name:"PV"},{name:"PSC"},{name:"PMN"},{name:"PRTB"},{name:"PSOL"},{name:"PRP"},{name:"PTdoB"},{name:"PSL"},{name:"PSDC"},{name:"PTC"},{name:"PHS"},{name:"S/PARTIDO"},{name:"PSD"},{name:"PPL"}])
