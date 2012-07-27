  pdf.move_down(10)
  pdf.text " #{Time.now.to_date}" ,:size => 20, :style=> :bold
  pdf.move_down(10)
  pdf.text "Bestellungs: #{@gruppe.title}  ", :size => 30, :style=> :bold

  pdf.move_down(30)
     arr = [Array.new]
     arr.push ["Name", "SpeiseNr/Name", "Preis","comment"]
 @gruppe.bestellungs.each do |bestellung|
     temp = Array.new
     temp = [bestellung.name, bestellung.speise, bestellung.preis, bestellung.comment]
     arr.push temp
  end


  pdf.table arr,
       :row_colors => ["FFFFFF","DDDDDD"],
       :column_widths => [100, 150, 50, 240] ,
       :header => true ,
       :cell_style => {:size => 15, :font_style=> :italic}


  pdf.move_down(10)

  pdf.text "Summe #{@gruppe.bestellungs.sum("preis")}", :size => 16, :style => :bold

