require 'fox16'
include Fox
require_relative '../compenents'
require_relative '../Customer'
include Customer

def detailcustomer(app, id)
  customerData = Customer.readcustomer(id)
  if customerData == []
    FXMessageBox.warning(app, MBOX_OK, "Müşteri Bulunamadı", "İşlem hata ile sonuçlandı girdiğiniz bilgileri kontrol ediniz.")
  else
    detailcustomerscreen = FXMainWindow.new(app, "Müşteri detay", width: 280, height: 205, :x=>5, :y=>25)
    Label.new(detailcustomerscreen, "Müşteri İd:", 100, 25, 5, 25)
    Label.new(detailcustomerscreen, customerData[0][0].to_s, 100, 25, 120, 25)
    Label.new(detailcustomerscreen, "Müşteri Adı:", 100, 25, 5, 50)
    Label.new(detailcustomerscreen, customerData[0][1].to_s, 140, 25, 120, 50)
    Label.new(detailcustomerscreen, "Müşteri Soyadı:", 120, 25, 5, 75)
    Label.new(detailcustomerscreen, customerData[0][2].to_s, 140, 25, 120, 75)
    Label.new(detailcustomerscreen, "Müşteri Telefonu:", 120, 25, 5, 100)
    Label.new(detailcustomerscreen, customerData[0][3].to_s, 140, 25, 120, 100)
    Label.new(detailcustomerscreen, "Müşteri E-postası:", 120, 25, 5, 125)
    Label.new(detailcustomerscreen, customerData[0][4].to_s, 140, 25, 120, 125)
    Label.new(detailcustomerscreen, "Müşteri TC. No:", 120, 25, 5, 150)
    Label.new(detailcustomerscreen, customerData[0][5].to_s, 140, 25, 120, 150)
    detailcustomerscreen.create
    detailcustomerscreen.show(PLACEMENT_SCREEN)
  end
end
