# noinspection RubyUnusedLocalVariable
class Checkout

  VALID_SKUS = ['A', 'B', 'C', 'D'].freeze

  def initialize
    @price_table = {
      'A' => 50,
      'B' => 30,
      'C' => 20
    }
  end

  def checkout(skus)
    skus_list = skus && skus.is_a?(String) ? skus.chars : []
    return -1 if invalid_skus?(skus_list)

    0
  end

  private

  def invalid_skus?(skus)
    skus.empty? || skus.select {|sku| !VALID_SKUS.include?(sku) }.count > 0
  end

end



