# noinspection RubyUnusedLocalVariable
class Checkout

  VALID_SKUS = ['A', 'B', 'C', 'D'].freeze

  def checkout(skus)
    return -1 if invalid_skus?(skus)
  end

  private

  def invalid_skus?(skus)

  end

end

