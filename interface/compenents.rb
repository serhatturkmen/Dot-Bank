require 'fox16'
include Fox

class Label
  def initialize(app, title, width, height, x, y)
    return FXLabel.new(app, title, :opts=>LAYOUT_EXPLICIT, :width=>width, :height=>height, :x=>x, :y=>y)
  end
end

class Table
  def initialize(app, records, titles)
    table = FXTable.new(app, :opts=> LAYOUT_FILL_X | LAYOUT_FILL_Y)
    #table.setTableSize(5, 6) #satır sütun
    table.rowHeaderMode = LAYOUT_FIX_WIDTH
    table.rowHeaderWidth = 0
    table.editable = false
    table.columnHeaderMode = LAYOUT_FIX_HEIGHT
    table.columnHeaderHeight = 25
    table.setTableSize(records.length(), titles.length())
    #başlıklar
    titles.each_with_index do |row, index|
      table.setColumnText(index, row)
    end
    table.setColumnWidth(0, 30)
    table.setColumnWidth(1, 90)
    table.setColumnWidth(2, 90)
    table.setColumnWidth(3, 110)
    table.setColumnWidth(4, 150)
    if titles.length() == 6
      table.setColumnWidth(5, 80)
    end
    #kayıtlar
    records.each_with_index do |row, index|
      table.setItemText(index, 0, row[0].to_s)
      table.setItemText(index, 1, row[1].to_s)
      table.setItemText(index, 2, row[2])
      table.setItemText(index, 3, row[3])
      table.setItemText(index, 4, row[4])
      if titles.length() == 6
        table.setItemText(index, 5, row[5].to_s)
      end
    end
    return table
  end
end