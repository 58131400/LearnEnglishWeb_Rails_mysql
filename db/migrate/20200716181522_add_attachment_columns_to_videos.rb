class AddAttachmentColumnsToVideos < ActiveRecord::Migration[6.0]
  def change
    add_attachment :video, :attachment

  end
end
