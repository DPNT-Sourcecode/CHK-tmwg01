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

    0
  end

  private

  def invalid_skus?(skus)
    skus.empty? || skus.select {|sku| !@price_table.keys.include?(sku) }.count > 0
  end

  def sum(skus)

  end

end




