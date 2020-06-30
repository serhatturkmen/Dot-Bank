require 'fox16'
include Fox
require_relative '../compenents'
require_relative '../Account'
include Account

def addaccount(app)
  addaccountscreen = FXMainWindow.new(app, "Hesaplar", width: 290, height: 205, :x=>5, :y=>25)
  Label.new(addaccountscreen, "Müşteri Numarası:", 150, 25, 5, 25)
  customerid_tb = FXTextField.new(addaccountscreen, 11, :opts=>LAYOUT_EXPLICIT, :width=>120, :height=>25, :x=>160, :y=>25)

  Label.new(addaccountscreen, "Hesap Tipi:", 150, 25, 5, 55)
  accounttype_tb = FXTextField.new(addaccountscreen, 30, :opts=>LAYOUT_EXPLICIT, :width=>120, :height=>25, :x=>160, :y=>55)

  Label.new(addaccountscreen, "Tarih (format 20.2.2020 ):", 150, 25, 5, 85)
  accountdate_tb = FXTextField.new(addaccountscreen, 30, :opts=>LAYOUT_EXPLICIT, :width=>120, :height=>25, :x=>160, :y=>85)

  btn_add = FXButton.new(addaccountscreen, "Ekle", :opts=>LAYOUT_EXPLICIT, :width=>280, :height=>25, :x=>5, :y=>115)
  btn_add.connect(SEL_COMMAND) do
    addaccountexec = Account.createaccount(customerid_tb.text.to_i, accounttype_tb.text, 0, accountdate_tb.text)
    if addaccountexec
      FXMessageBox.information(self, MBOX_OK, "İşlem Tamamlandı", "İşlem başarıyla tamamlanmıştır.")
      addaccountscreen.close
    else
      FXMessageBox.warning(self, MBOX_OK, "İşlem Başarısız", "İşlem hata ile sonuçlandı girdiğiniz bilgileri kontrol ediniz.")
      addaccountscreen.close
    end
  end
  addaccountscreen.create
  addaccountscreen.show(PLACEMENT_SCREEN)
end

