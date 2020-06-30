require 'fox16'
include Fox
require_relative '../compenents'
require_relative '../Customer'
include Customer

def addcustomer(app)
  addcustomerscreen = FXMainWindow.new(app, "Müşteri Ekle", width: 250, height: 205, :x=>5, :y=>25)
  FXLabel.new(addcustomerscreen, "Müsteri Ekleme Sayfası")
  Label.new(addcustomerscreen, "Müşteri TC. No:", 100, 25, 5, 25)
  customertcno_tb = FXTextField.new(addcustomerscreen, 11, :opts=>LAYOUT_EXPLICIT, :width=>120, :height=>25, :x=>115, :y=>25)

  Label.new(addcustomerscreen, "Müşteri Adı:", 100, 25, 5, 55)
  customername_tb = FXTextField.new(addcustomerscreen, 30, :opts=>LAYOUT_EXPLICIT, :width=>120, :height=>25, :x=>115, :y=>55)

  Label.new(addcustomerscreen, "Müşteri Soyadı:", 100, 25, 5, 85)
  customersurname_tb = FXTextField.new(addcustomerscreen, 30, :opts=>LAYOUT_EXPLICIT, :width=>120, :height=>25, :x=>115, :y=>85)

  Label.new(addcustomerscreen, "Müşteri Telefonu:", 100, 25, 5, 115)
  customerphone_tb = FXTextField.new(addcustomerscreen, 30, :opts=>LAYOUT_EXPLICIT, :width=>120, :height=>25, :x=>115, :y=>115)

  Label.new(addcustomerscreen, "Müşteri Email:", 100, 25, 5, 145)
  customeremail_tb = FXTextField.new(addcustomerscreen, 30, :opts=>LAYOUT_EXPLICIT, :width=>120, :height=>25, :x=>115, :y=>145)

  btn_add = FXButton.new(addcustomerscreen, "Ekle", :opts=>LAYOUT_EXPLICIT, :width=>220, :height=>25, :x=>5, :y=>175)
  btn_add.connect(SEL_COMMAND) do
    addcustomerexec = Customer.createcustomer(customername_tb.text, customersurname_tb.text, customerphone_tb.text, customeremail_tb.text, customertcno_tb.text.to_i)
    if addcustomerexec
      FXMessageBox.information(self, MBOX_OK, "İşlem Tamamlandı", "İşlem başarıyla tamamlanmıştır.")
      addcustomerscreen.close
    else
      FXMessageBox.warning(self, MBOX_OK, "İşlem Başarısız", "İşlem hata ile sonuçlandı girdiğiniz bilgileri kontrol ediniz.")
      addcustomerscreen.close
    end
  end
  addcustomerscreen.create
  addcustomerscreen.show(PLACEMENT_SCREEN)
end