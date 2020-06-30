require 'fox16'
include Fox
require_relative '../compenents'
require_relative '../Account'
include Account

def deleteaccount(app)
  deleteaccountscreen = FXMainWindow.new(app, "Hesaplar", width: 350, height: 35, x: 20, y: 30)
  Label.new(deleteaccountscreen, "Hesap Numarası:", 120, 25, 5, 5)
  accountid_tb = FXTextField.new(deleteaccountscreen, 11, :opts=>LAYOUT_EXPLICIT, :width=>100, :height=>25, :x=>125, :y=>5)

  btn_delete = FXButton.new(deleteaccountscreen, "SİL", :opts=>LAYOUT_EXPLICIT, :width=>80, :height=>25, :x=>225, :y=>5)
  btn_delete.connect(SEL_COMMAND) do
    Account.delete(accountid_tb.text.to_i)
    FXMessageBox.information(self, MBOX_OK, "İşlem Tamamlandı", "İşlem başarıyla tamamlanmıştır.")
    deleteaccountscreen.close
  end
  deleteaccountscreen.create
  deleteaccountscreen.show(PLACEMENT_SCREEN)
end


