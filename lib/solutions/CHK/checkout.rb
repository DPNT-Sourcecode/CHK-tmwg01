# noinspection RubyUnusedLocalVariable
class Checkout

  VALID_SKUS = ['A', 'B', 'C', 'D'].freeze

  def checkout(skus)
    skus_list = skus && skus.is_a?(String) ? skus.chars : []
    return -1 if invalid_skus?(skus_list)

    0
  end

  private

  def invalid_skus?(skus)
    skus.select {|sku| !VALID_SKUS.include?(sku) }.count > 0
  end

end


