require 'roo'
require 'csv'

excel = Roo::Spreadsheet.open('SampleData.xlsx', extension: :xlsx)
excel.default_sheet = excel.sheets[1]
total_row =  excel.last_row


csv_data = []
count = 1
2.upto(total_row) do |f|
     csv_data.push(excel.row(f).push(Time.now).unshift(count))
     count+=1
end

file_path = "SampleData.csv"

CSV.open(file_path, "wb") do |csv|
    # csv << excel.row(1)
    csv_data.each do |x|
        csv << x
    end
end


# csv_data.each do |x|

# end