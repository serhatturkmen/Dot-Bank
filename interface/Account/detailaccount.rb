require 'fox16'
include Fox
require_relative '../compenents'
require_relative '../Account'
include Account

def detailaccount(app, id)
  accountData = Account.readaccount(id.to_i)
  if accountData == []
    FXMessageBox.warning(app, MBOX_OK, "Hesap Bulunamadı", "İşlem hata ile sonuçlandı girdiğiniz bilgileri kontrol ediniz.")
  else
    detailaccountscreen = FXMainWindow.new(app, "Hesap detay", width: 280, height: 205, :x=>5, :y=>25)
    Label.new(detailaccountscreen, "Hesap İd:", 100, 25, 5, 25)
    Label.new(detailaccountscreen, accountData[0][0].to_s, 100, 25, 120, 25)
    Label.new(detailaccountscreen, "Müşteri Numarası:", 130, 25, 5, 50)
    Label.new(detailaccountscreen, accountData[0][1].to_s, 120, 25, 130, 50)
    Label.new(detailaccountscreen, "Hesap Tipi:", 120, 25, 5, 75)
    Label.new(detailaccountscreen, accountData[0][2].to_s, 120, 25, 120, 75)
    Label.new(detailaccountscreen, "Hesap Bakiyesi:", 120, 25, 5, 105)
    Label.new(detailaccountscreen, accountData[0][3].to_s, 120, 25, 120, 105)
    Label.new(detailaccountscreen, "Hesap Tarihi:", 120, 25, 5, 135)
    Label.new(detailaccountscreen, accountData[0][4].to_s, 120, 25, 120, 135)
    detailaccountscreen.create
    detailaccountscreen.show(PLACEMENT_SCREEN)
  end
end

