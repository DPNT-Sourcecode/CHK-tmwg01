# noinspection RubyUnusedLocalVariable
class Checkout

  VALID_SKUS = ['A', 'B', 'C', 'D'].freeze

  def checkout(skus)
    skus_list = skus && skus.is_a?(String) ? skus.chars : []
    return -1 if invalid_skus?(skus)

    0
  end

  private

  def invalid_skus?(skus)
    false
  end

end

