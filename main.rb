require 'fox16'
include Fox

require_relative 'interface/Customer/addcustomer'
require_relative 'interface/Customer/deletecustomer'
require_relative 'interface/Customer/detailcustomer'
require_relative 'interface/Customer/viewcustomers'
require_relative 'interface/Account/viewaccount'
require_relative 'interface/Account/addaccount'
require_relative 'interface/Account/deleteaccount'
require_relative 'interface/Account/detailaccount'
require_relative 'interface/transfer'

class Main < FXMainWindow
  def initialize(app)
    super(app, "Dot BANK", :width=> 430, :height=> 175)
    add_menu_bar
    detailcustomerpanel
    detailaccountpanel
  end
  def create
    super
    show(PLACEMENT_SCREEN)
  end
  private
  def detailcustomerpanel
    detailcustomerframe = FXHorizontalFrame.new(self, :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>150, :x=>10, :y=>25)
    FXLabel.new(detailcustomerframe, "Müşteri Detay", :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>10, :y=>25)
    FXLabel.new(detailcustomerframe, "Müşteri numarasını giriniz", :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>10, :y=>50)
    detailid = FXTextField.new(detailcustomerframe, 11, :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>10, :y=>75)
    detailbtn = FXButton.new(detailcustomerframe, "SORGULA", :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>10, :y=>100)
    detailbtn.connect(SEL_COMMAND) do
      if detailid.text.delete(' ') == ""
        FXMessageBox.warning(detailcustomerframe, MBOX_OK, "Hata", "Giriş Dizesi doğru değil")
      else
        detailcustomer(app, detailid.text)
      end
    end
  end
  private
  def detailaccountpanel
    detailaccountframe = FXHorizontalFrame.new(self, :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>150, :x=>210, :y=>25)
    FXLabel.new(detailaccountframe, "Hesap Detay", :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>10, :y=>25)
    FXLabel.new(detailaccountframe, "Hesap numarası giriniz", :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>10, :y=>50)
    detailid = FXTextField.new(detailaccountframe, 11, :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>10, :y=>75)
    detailbtn = FXButton.new(detailaccountframe, "SORGULA", :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>10, :y=>100)
    detailbtn.connect(SEL_COMMAND) do
      if detailid.text.delete(' ') == ""
        FXMessageBox.warning(detailaccountframe, MBOX_OK, "Hata", "Giriş Dizesi doğru değil")
      else
        detailaccount(app, detailid.text)
      end
    end
  end
  def add_menu_bar
    menu_bar = FXMenuBar.new(self, LAYOUT_SIDE_TOP | LAYOUT_FILL_X)
    file_menu = FXMenuPane.new(self)
    FXMenuTitle.new(menu_bar, "Ana işlemler", :popupMenu => file_menu)
    depositbutton = FXMenuCommand.new(file_menu, "Para Yatır")
    depositbutton.connect(SEL_COMMAND) do
      dodeposit(app)
    end
    withdrawalbutton = FXMenuCommand.new(file_menu, "Para Çekme")
    withdrawalbutton.connect(SEL_COMMAND) do
      dowithdrawal(app)
    end
    transfer = FXMenuCommand.new(file_menu, "Para Transferi")
    transfer.connect(SEL_COMMAND) do
      dotransfer(app)
    end
    customermainmenu = FXMenuPane.new(self)
    FXMenuTitle.new(menu_bar, "Müşteriler", :popupMenu => customermainmenu)
    viewcustomer = FXMenuCommand.new(customermainmenu, "Tümünü Görüntüle")
    viewcustomer.connect(SEL_COMMAND) do
      viewcustomers(app)
    end
    addcustomermenu = FXMenuCommand.new(customermainmenu, "Müşteri Ekle")
    addcustomermenu.connect(SEL_COMMAND) do
      addcustomer(app)
    end
    deletecustomermenu = FXMenuCommand.new(customermainmenu, "Müşteri Sil")
    deletecustomermenu.connect(SEL_COMMAND) do
      deletecustomer(app)
    end
    accountmainmenu = FXMenuPane.new(self)
    FXMenuTitle.new(menu_bar, "Hesaplar", :popupMenu => accountmainmenu)
    viewaccount = FXMenuCommand.new(accountmainmenu, "Tümünü Görüntüle")
    viewaccount.connect(SEL_COMMAND) do
      viewaccount(app)
    end
    addaccount = FXMenuCommand.new(accountmainmenu, "Hesap Ekle")
    addaccount.connect(SEL_COMMAND) do
      addaccount(app)
    end
    deleteaccount = FXMenuCommand.new(accountmainmenu, "Hesap Sil")
    deleteaccount.connect(SEL_COMMAND) do
      deleteaccount(app)
    end
    info_cmd = FXMenuCommand.new(menu_bar, "Ayrıntılar")
    info_cmd.connect(SEL_COMMAND) do
      FXMessageBox.information(self, MBOX_OK, "Tasarlayan", "Bu yazılım Muhammed Serhat TÜRKMEN tarafından yazılmıştır.")
    end
    exit_cmd = FXMenuCommand.new(menu_bar, "Çıkış")
    exit_cmd.connect(SEL_COMMAND) do
      exit
    end
  end
end


if __FILE__ == $0
  app = FXApp.new
  Main.new(app)
  app.create
  app.run

end