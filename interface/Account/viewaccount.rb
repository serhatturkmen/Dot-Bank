require 'fox16'
include Fox
require_relative '../compenents'
require_relative '../Account'
include Account

def viewaccount(app)
  viewaccountscreen = FXMainWindow.new(app, "Hesaplar", width: 600, height: 205, :x=>5, :y=>25)
  accountData = Account.readaccountall
  titles = ["İd", "Müşteri No", "Hesap Tipi", "Bakiyesi", "Tarihi"]
  Table.new(viewaccountscreen, accountData, titles)
  viewaccountscreen.create
  viewaccountscreen.show(PLACEMENT_SCREEN)
end
