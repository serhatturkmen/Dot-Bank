require 'sqlite3'
module Account
  @db = SQLite3::Database.open "bankdb.db"
  def createaccount(customerId, accountType, accountBalance, accountDate)
    @db.execute "insert into Accounts (
                CustomerId,
                AccountType,
                AccountBalance,
                AccountDate
                )
                values (?,?,?,?)",customerId,accountType,accountBalance,accountDate
  end
  def readaccountall
    accountall = @db.execute "Select AccountId, CustomerId, AccountType, AccountBalance, AccountDate from Accounts"
    return accountall
  end
  def readaccount(id)
    account = @db.execute "Select
              AccountId,
              CustomerId,
              AccountType,
              AccountBalance,
              AccountDate
              from Accounts WHERE AccountId = #{id} "
    return account
  end
  def withdrawal(id, balance)
    account = @db.execute "Select AccountBalance from Accounts WHERE AccountId = #{id}"
    accountbalance = account[0][0].to_i
    newbalance = accountbalance - balance
    @db.execute "UPDATE Accounts SET AccountBalance = #{newbalance.to_s} WHERE AccountId = #{id}"
  end
  def deposit(id, balance)
    account = @db.execute "Select AccountBalance from Accounts WHERE AccountId = #{id}"
    newbalance = account[0][0].to_i + balance
    @db.execute "UPDATE Accounts SET AccountBalance = #{newbalance.to_s} WHERE AccountId = #{id}"
  end
  def update(accountId, accountType, accountBalance)
    @db.execute "UPDATE Accounts SET
                AccountType=#{accountType},
                AccountBalance=#{accountBalance},
                WHERE AccountId=#{accountId}"
  end
  def delete(accountId)
    deleteAccount = @db.execute "DELETE  FROM Accounts WHERE AccountId=#{accountId}"
  end
end