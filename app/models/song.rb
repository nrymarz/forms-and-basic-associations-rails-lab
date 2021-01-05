class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :genre 
  belongs_to :artist
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def song_notes=(notes)
    notes.each do |note| 
      note = Note.create(content: note)
      self.notes << note 
    end
  end
end
