# noinspection RubyUnusedLocalVariable
class Checkout

  def initialize
    @price_table = {
      'A' => 50,
      'B' => 30,
      'C' => 20,
      'D' => 15,
      'E' => 40,
      'F' => 10,
      'G' => 20,
      'H' => 10,
      'I' => 35,
      'J' => 60,
      'K' => 80,
      'L' => 90,
      'M' => 15,
      'N' => 40,
      'O' => 10,
      'P' => 50,
      'Q' => 30,
      'R' => 50,
      'S' => 30,
      'T' => 20,
      'U' => 40,
      'V' => 50,
      'W' => 20,
      'X' => 90,
      'Y' => 10,
      'Z' => 50,
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
    discount_for_a(skus) + discount_for_b(skus) + discount_for_e(skus) + discount_for_f(skus) + discount_for_h(skus)
  end

  def discount_for_a(skus)
    as = skus.select {|sku| sku == 'A' }

    discount_groups = as.each_slice(5).to_a

    return 0 if discount_groups.count == 0

    discount_groups.map do |group|
      if group.size == 5
        50
      else
        group.size / 3 * 20
      end
    end.sum
  end

  def discount_for_b(skus)
    bs = skus.select {|sku| sku == 'B' }

    items_already_with_discount = discount_for_e(skus) / @price_table['B']

    (bs.count - items_already_with_discount) / 2 * 15
  end

  def discount_for_e(skus)
    es = skus.select {|sku| sku == 'E' }
    bs = skus.select {|sku| sku == 'B' }

    free_bs = bs.take(es.count / 2).count
    free_bs * @price_table['B']
  end

  def discount_for_f(skus)
    fs = skus.select {|sku| sku == 'F' }


    free_bs = fs.size / 3
    free_bs * @price_table['F']
  end

  def discount_for_h(skus)
    hs = skus.select {|sku| sku == 'H' }

    discount_groups = hs.each_slice(10).to_a

    return 0 if discount_groups.count == 0

    discount_groups.map do |group|
      if group.size == 10
        20
      else
        group.size / 5 * 5
      end
    end.sum
  end

  def discount_for_k(skus)
    as = skus.select {|sku| sku == 'K' }

    discount_groups = as.each_slice(10).to_a

    return 0 if discount_groups.count == 0

    discount_groups.map do |group|
      if group.size == 10
        20
      else
        group.size / 5 * 5
      end
    end.sum
  end

end






