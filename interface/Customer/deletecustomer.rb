require 'fox16'
include Fox

require_relative '../Customer'
include Customer


def deletecustomer(app)
  deletecustomerscreen = FXMainWindow.new(app, "Müşteri Silme", width: 350, height: 35, :x=>5, :y=>25)
  FXLabel.new(deletecustomerscreen, "Müşteri Numarası:", :opts=>LAYOUT_EXPLICIT, :width=>120, :height=>25, :x=>5, :y=>5)
  customerid_tb = FXTextField.new(deletecustomerscreen, 30, :opts=>LAYOUT_EXPLICIT, :width=>100, :height=>25, :x=>125, :y=>5)

  btn_delete = FXButton.new(deletecustomerscreen, "SİL", :opts=>LAYOUT_EXPLICIT, :width=>100, :height=>25, :x=>225, :y=>5)
  btn_delete.connect(SEL_COMMAND) do
    Customer.customerdelete(customerid_tb.text.to_i)
    FXMessageBox.information(self, MBOX_OK, "İşlem Tamamlandı", "İşlem başarıyla tamamlanmıştır.")
    deletecustomerscreen.close
  end
  deletecustomerscreen.create
  deletecustomerscreen.show(PLACEMENT_SCREEN)
end
