class Dessert
  def initialize(name,calories)
    @name=name
    @calories=calories
  end

  def calories
    @calories
  end

  def name
    @name
  end

  def calories=(calories)
    @calories=calories
  end

  def name=(name)
    @name=name
  end

  def healthy?
    if @calories<200
      return true
    end
    false
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(flavor)
    @name=flavor+' jelly bean'
    @calories=5
  end

  def delicious?
    if name=='licorice jelly bean'
      return false
    end
    true
  end
end
