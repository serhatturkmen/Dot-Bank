require 'fox16'
include Fox
require_relative '../compenents'
require_relative '../Customer'
include Customer

def viewcustomers(app)
  viewcustomerscreen = FXMainWindow.new(app, "Müşteriler", width: 600, height: 205, :x=>5, :y=>25)
  customerData = Customer.readall
  titles=[
      "İd", "Adı", "Soyadı", "Telefon", "Email", "TC No"
  ]
  Table.new(viewcustomerscreen, customerData, titles)
  viewcustomerscreen.create
  viewcustomerscreen.show(PLACEMENT_SCREEN)
end