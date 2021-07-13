Comment = Struct.new(:text, :created_at, :review_id, :user_id)
c = Comment.new("This is a comment.")
c.user_id = 1
c.text
p c

Comment = Struct.new(:text, :created_at, :review_id, :user_id, keyword_init: true)
c = Comment.new(text: "This is a comment.", user_id: 1)
p c

Comment = Struct.new(:text, :created_at, :review_id, :user_id) do
  def snippet
    text.length > 50 ? "#{text[0...47]}..." : text
  end
end

c.each_pair { |name, value| puts("#{name} => #{value}") }
