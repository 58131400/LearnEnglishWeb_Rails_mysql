class VocabualaryController < ApplicationController
  def addDict
    file = File.open("C:/Users/DucThai/main/HocTap/Nam 4/DoAnTotNghiep/flac/index.tags.txt")
    name = nil
    namePath = nil
    alphadix = nil
    file.each_line do |line|
      if line.start_with?("[")
        namePath = line.slice(1, line.index("]") - 1)

      end

      if line.include?("SWAC_ALPHAIDX")
        alphadix = line.slice(line.index("=") + 1, line.length)
      end
      if line.include?("SWAC_TEXT")
        name = line.slice(line.index("=") + 1, line.length)
        @audio = Audio.create(Path: namePath, Content: name)
      end


    end

    file.close

  end

  def index
    @part = Part.find(params[:id])
    @id = @part.PartId
    @unitId = @part.unit_id
    @words = Word.where("vocabualary_id =?", @id)

  end
end
