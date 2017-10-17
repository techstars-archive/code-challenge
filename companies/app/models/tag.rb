class Tag < ApplicationRecord
  belongs_to :company
  before_save :downcase_text

  def downcase_text
    self.text.downcase!
  end
end
