class Dog
  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_json(*_args)
    { name: @name, age: @age }.to_json
  end
end
