require 'fox16'
include Fox
require_relative 'compenents'
require_relative 'Customer'
include Customer
require_relative 'Account'
include Account

def dotransfer(app)
  transferscreen = FXMainWindow.new(app, "Para Transferi", width: 210, height: 205, :x=>5, :y=>25)
  Label.new(transferscreen, "Gönderici Hesap Numarası:", 200, 25, 5, 25)
  senderaccountid = FXTextField.new(transferscreen, 11, :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>5, :y=>50)

  Label.new(transferscreen, "Alıcı Hesap Numarası:", 200, 25, 5, 80)
  receiveraccountid = FXTextField.new(transferscreen, 30, :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>5, :y=>105)

  Label.new(transferscreen, "Gönderilecek Bakiye:", 200, 25, 5, 130)
  balance = FXTextField.new(transferscreen, 30, :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>5, :y=>155)

  btn_transfer = FXButton.new(transferscreen, "Transferi Gerçekleştir", :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>5, :y=>180)
  btn_transfer.connect(SEL_COMMAND) do
    senderaccount = Account.readaccount(senderaccountid.text.to_i)
    if senderaccount.length() == 1
      receiveraccount = Account.readaccount(receiveraccountid.text.to_i)
      if receiveraccount.length() == 1
        if balance.text == " " and  balance.text == ""
          FXMessageBox.warning(transferscreen, MBOX_OK, "HATA", "Bakiye giriş dizesi düzgün değil")
        else
          input_balance = balance.text.chomp().to_i
          if input_balance <= senderaccount[0][3].to_i
            Account.withdrawal(senderaccountid.text.to_i, input_balance)
            Account.deposit(receiveraccountid.text.to_i, input_balance)
            FXMessageBox.information(transferscreen, MBOX_OK, "BAŞARILI", "İşleminiz başarılı bir şekilde yapılmıştır.")
          else
            FXMessageBox.warning(transferscreen, MBOX_OK, "HATA", "Gönderen hesabın bakiyesi yeterli değildir.")
          end
        end
      else
        FXMessageBox.warning(transferscreen, MBOX_OK, "HATA", "Alıcının hesap numarası bulunamadı. Hesap numarası hatalı veya yanlış. Lütfen tekrar deneyiniz.")
      end
    else
      FXMessageBox.warning(transferscreen, MBOX_OK, "HATA", "Göndericinin hesap numarası bulunamadı. Hesap numarası hatalı veya yanlış. Lütfen tekrar deneyiniz.")
    end
  end
  transferscreen.create
  transferscreen.show(PLACEMENT_SCREEN)
end

def dowithdrawal(app)
  withdrawalscreen = FXMainWindow.new(app, "Para Çekme", width: 210, height: 160, :x=>5, :y=>25)
  Label.new(withdrawalscreen, "Hesap Numarası:", 200, 25, 5, 5)
  acconttextfield = FXTextField.new(withdrawalscreen, 11, :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>5, :y=>35)

  Label.new(withdrawalscreen, "Çekilecek Miktar:", 200, 25, 5, 65)
  balance = FXTextField.new(withdrawalscreen, 30, :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>5, :y=>95)

  btn_withdrawal = FXButton.new(withdrawalscreen, "ÇEK", :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>5, :y=>125)
  btn_withdrawal.connect(SEL_COMMAND) do
    accountid = acconttextfield.text.to_i
    input_balance = balance.text.chomp().to_i
    account = Account.readaccount(accountid)
    if account.length() == 1
      if input_balance == ""
        FXMessageBox.warning(withdrawalscreen, MBOX_OK, "HATA", "Bakiye giriş dizesi düzgün değil")
      else
        if input_balance <= account[0][3].to_i
          Account.withdrawal(accountid, input_balance)
          FXMessageBox.information(withdrawalscreen, MBOX_OK, "BAŞARILI", "İşleminiz başarılı bir şekilde yapılmıştır.")
        else
          FXMessageBox.warning(withdrawalscreen, MBOX_OK, "Hata", "İşlemi gerçekleştirmek için hesap yeterli bakiyeye sahip değil.")
        end
      end
    else
      FXMessageBox.warning(withdrawalscreen, MBOX_OK, "HATA", "Hesap bulunamadı.")
    end
  end
  withdrawalscreen.create
  withdrawalscreen.show(PLACEMENT_SCREEN)
end

def dodeposit(app)
  depositscreen = FXMainWindow.new(app, "Para Çekme", width: 210, height: 160, :x=>5, :y=>25)
  Label.new(depositscreen, "Hesap Numarası:", 200, 25, 5, 5)
  acconttextfield = FXTextField.new(depositscreen, 11, :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>5, :y=>35)

  Label.new(depositscreen, "Yatırılacak Miktar:", 200, 25, 5, 65)
  balance = FXTextField.new(depositscreen, 30, :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>5, :y=>95)

  btn_deposit = FXButton.new(depositscreen, "YATIR", :opts=>LAYOUT_EXPLICIT, :width=>200, :height=>25, :x=>5, :y=>125)
  btn_deposit.connect(SEL_COMMAND) do
    accountid = acconttextfield.text.to_i
    input_balance = balance.text.chomp().to_i
    account = Account.readaccount(accountid)
    if account.length() == 1
      if input_balance == ""
        FXMessageBox.warning(depositscreen, MBOX_OK, "HATA", "Bakiye giriş dizesi düzgün değil")
      else
        Account.deposit(accountid, input_balance)
        FXMessageBox.information(depositscreen, MBOX_OK, "BAŞARILI", "İşleminiz başarılı bir şekilde yapılmıştır.")
      end
    else
      FXMessageBox.warning(depositscreen, MBOX_OK, "HATA", "Hesap bulunamadı.Lütfen hesap numarasını kontrol ederek tekrar deneyiniz.")
    end
  end
  depositscreen.create
  depositscreen.show(PLACEMENT_SCREEN)
end