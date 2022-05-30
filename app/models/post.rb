class Post < ApplicationRecord
  def title_length
    title&.length
  end

  def sum a, b
    a + b
  end
end
