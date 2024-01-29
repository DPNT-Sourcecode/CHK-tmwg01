# noinspection RubyUnusedLocalVariable
class Checkout

  def initialize
    @price_table = {
      'A' => 50,
      'B' => 30,
      'C' => 20,
      'D' => 15
    }
  end

  def checkout(skus)
    skus_list = skus && skus.is_a?(String) ? skus.chars : []
    return -1 if invalid_skus?(skus_list)

    sum(skus_list)
  end

  private

  def invalid_skus?(skus)
    skus.empty? || skus.select {|sku| !@price_table.keys.include?(sku) }.count > 0
  end

  def sum(skus)
    skus.map {|sku| @price_table[sku]}.sum
  end

  def discount_for_a(skus)
  end

  end

end






