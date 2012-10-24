require "test/unit"

class TestTateti < Test::Unit::TestCase

  def test_tablero_vacio
  	tablero = Tablero.new

    assert_equal true, tablero.vacio?
  end
end

class Tablero

	def vacio?
		true
	end
end
