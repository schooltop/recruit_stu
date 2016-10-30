module FileHandle
  def import_data(file,current_user)
    imports = { failed: []}
    messages = {color:"#ff0000"}
    unless file.blank?
      orig_name = file.original_filename
      if ".XLSX" == File.extname(orig_name).upcase
        require 'roo'
        @students = []
        path = file.tempfile.path
        workbook = Roo::Spreadsheet.open path
        worksheet = workbook.sheet(0)
        row_no = 1
        worksheet.each_row_streaming(offset: 1, pad_cells: true) do |row|
          row_no += 1
          next if row[0].blank?
          record = {excel_row: row_no, success: true}
          self::IMPORT_COLUMNS.each do |c,i|
            record[c] = row[i]&.value 
          end
          return_student, message = self.save_from_hash(record, current_user)
          @students << return_student
          if return_student.blank?
            record[:success] = false
            record[:message] = message
            imports[:failed] << record 
          end
        end
        if imports == { failed: [] }
          messages[:color] = "#00DD00"
          messages[:detail] = "导入成功"
        end  
      else
        messages[:detail] = "文件格式要求为.xlsx格式。"
      end  
    else
      messages[:detail] = "请上传文件"
    end

    [imports,messages]
  end

  def export_data
    file = Spreadsheet.open "#{Rails.root}/public/xls/#{self.table_name}.xls"
    list = file.worksheet  0
    self.all.each_with_index do |r,index|
      self::EXPORT_COLUMN.each do |k,v|
        k = k.to_s
        list[index+1,v] = k.include?('|') ? r.send(k.split('|').first)&.send(k.split('|').last) : r.send(k)
      end
    end
    xls_report = StringIO.new
    file.write xls_report
    return xls_report.string
  end
end