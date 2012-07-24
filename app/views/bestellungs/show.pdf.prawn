
pdf.text "Bestellungs: #{@bestellung.title}", :size => 30, :style=> :bold

pdf.move_down(30)
     arr = [Array.new]
     arr.push ["Name", "SpeiseNr/Name", "Preis","comment"]
 @bestellung.auftrags.each do |auftrag|
     temp = Array.new
     temp = [auftrag.name, auftrag.speise, auftrag.preis, auftrag.comment]
     arr.push temp
  end


     pdf.table arr,
       :row_colors => ["FFFFFF","DDDDDD"],
       :column_widths => [100, 150, 50, 240] ,
       :header => true ,
       :cell_style => {:size => 15, :font_style=> :italic}





      pdf.move_down(10)

        pdf.text "Summe #{@bestellung.auftrags.sum("preis")}", :size => 16, :style => :bold