# noinspection RubyUnusedLocalVariable
class Checkout

  def initialize
    @price_table = {
      'A' => 50,
      'B' => 30,
      'C' => 20,
      'D' => 15,
      'E' => 40,
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
    discount_for_a(skus) + discount_for_b(skus) + discount_for_e(skus)
  end

  def discount_for_a(skus)
    as = skus.select {|sku| sku == 'A' }

    discount_groups = as.each_slice(5).to_a

    return 0 if discount_groups.count == 0

    as.count / 3 * 20
  end

  def discount_for_b(skus)
    bs = skus.select {|sku| sku == 'B' }

    bs.count / 2 * 15
  end

  def discount_for_e(skus)
    es = skus.select {|sku| sku == 'E' }
    bs = skus.select {|sku| sku == 'B' }

    free_bs = bs.take(es.count / 2).count
    free_bs * 30
  end

end


