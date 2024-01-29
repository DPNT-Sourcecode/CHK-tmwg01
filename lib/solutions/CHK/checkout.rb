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
      'K' => 70,
      'L' => 90,
      'M' => 15,
      'N' => 40,
      'O' => 10,
      'P' => 50,
      'Q' => 30,
      'R' => 50,
      'S' => 20,
      'T' => 20,
      'U' => 40,
      'V' => 50,
      'W' => 20,
      'X' => 17,
      'Y' => 20,
      'Z' => 21,
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
    discount_for_a(skus) + discount_for_b(skus) + discount_for_e(skus) + discount_for_f(skus) + discount_for_h(skus) + discount_for_k(skus) +
    discount_for_n(skus) + discount_for_p(skus) + discount_for_q(skus) + discount_for_r(skus) + discount_for_u(skus) + discount_for_v(skus)
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
    ks = skus.select {|sku| sku == 'K' }

    ks.count / 2 * 20
  end

  def discount_for_n(skus)
    ns = skus.select {|sku| sku == 'N' }
    ms = skus.select {|sku| sku == 'M' }

    free_ms = ms.take(ns.count / 3).count
    free_ms * @price_table['M']
  end

  def discount_for_p(skus)
    ps = skus.select {|sku| sku == 'P' }

    ps.count / 5 * 50
  end

  def discount_for_q(skus)
    qs = skus.select {|sku| sku == 'Q' }

    items_already_with_discount = discount_for_r(skus) / @price_table['Q']

    (qs.count - items_already_with_discount) / 3 * 10
  end

  def discount_for_r(skus)
    rs = skus.select {|sku| sku == 'R' }
    qs = skus.select {|sku| sku == 'Q' }

    free_qs = qs.take(rs.count / 3).count
    free_qs * @price_table['Q']
  end

  def discount_for_u(skus)
    us = skus.select {|sku| sku == 'U' }

    free_us = us.size / 4
    free_us * @price_table['U']
  end

  def discount_for_v(skus)
    vs = skus.select {|sku| sku == 'V' }

    discount_groups = vs.each_slice(3).to_a

    return 0 if discount_groups.count == 0

    discount_groups.map do |group|
      if group.size == 3
        20
      else
        group.size / 2 * 10
      end
    end.sum
  end

  def discount_for_multiproduct(skus)
    discount_group = ['S', 'T', 'X', 'Y', 'Z']

  end
end






