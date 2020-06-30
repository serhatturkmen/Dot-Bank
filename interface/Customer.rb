require "sqlite3"
module Customer
  @db = SQLite3::Database.open "bankdb.db"
  def createcustomer(customername, customersurname, customerphone, customeremail, customertcno)
    begin
      @db.execute "insert into Customers (
                      CustomerName,
                      CustomerSurName,
                      CustomerPhone,
                      CustomerEmail,
                      CustomerTcNo
                      )
              values (?,?,?,?,?)",customername, customersurname, customerphone, customeremail, customertcno
      return true
    rescue Exception.Exception => e
      puts e
      return false
    end
  end
  def readall
    resultset = @db.execute "Select CustomerId, CustomerName, CustomerSurName, CustomerPhone, CustomerEmail, CustomerTcNo from Customers"
    #resultset = @db.execute "Select * from Customers"
    return resultset
  end
  def readcustomer(id)
    resultset = @db.execute "Select
          CustomerId,
          CustomerName,
          CustomerSurName,
          CustomerPhone,
          CustomerEmail,
          CustomerTcNo
          from Customers WHERE CustomerId=#{id}"
    return resultset
  end
  def updatecustomer(customerid, customername, customersurname, customerphone, customeremail)
    begin
      @db.execute "UPDATE Customers "+"
                   SET CustomerName=?,
                      CustomerSurName=?,
                      CustomerPhone=?,
                      CustomerEmail=?
                   WHERE CustomerId=?", customername,customersurname, customerphone, customeremail, customerid        # Attempt some action that may have an exception in SQLite
    rescue SQLite3::Exception => e
      return false
      puts e
    end
    return true
  end
  def countscustomer
    resultset = @db.execute "select count() from Customers"
    return resultset
  end
  def customerdelete(customerid)
    @db.execute "DELETE FROM Customers WHERE CustomerId=?", customerid
  end
end