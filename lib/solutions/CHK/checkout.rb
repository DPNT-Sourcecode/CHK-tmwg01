# noinspection RubyUnusedLocalVariable
class Checkout

  def initialize
    @price_table = {
      'A' => 50,
      'B' => 30,
      'C' => 20,
      'D' => 15,
      'E' => 15,
    }
  end

  def checkout(skus)
    skus_list = skus && skus.is_a?(String) ? skus.chars : []
    return 0 if skus == ''
    return -1 if invalid_skus?(skus_list)

    (sum(skus_list) - discounts(skus_list)) || 0
  end

  private

  def invalid_skus?(skus)
    skus.empty? || skus.select {|sku| !@price_table.keys.include?(sku) }.count > 0
  end

  def sum(skus)
    skus.map {|sku| @price_table[sku]}.sum
  end

  def discounts(skus)
    discount_for_a(skus) + discount_for_b(skus)
  end

  def discount_for_a(skus)
    as = skus.select {|sku| sku == 'A' }

    as.count / 3 * 20
  end

  def discount_for_b(skus)
    as = skus.select {|sku| sku == 'B' }

    as.count / 2 * 15
  end

end



