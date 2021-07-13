class User
  attr_reader :id
  attr_reader :name
  attr_reader :billing_details

  def initialize(id, name)
    @id = id
    @name = name
  end

  def current_user.update_billing(details)
    @billing_details = details
  end

  private

  def db_role
    # get the role
  end

  public

  def is_authorized_for?(page)
    # report authorization for `page`
  end
end

class Author < User
  def is_authorized_for?(page)
    if page.start_with?("author/")
      db_role == "author"
    else
      super
    end
  end
end
