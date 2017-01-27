class Hash(K, V)
  def >(key : K) : V
    fetch(key)
  end
end
