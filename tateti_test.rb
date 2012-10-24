require "test/unit"

class TestTateti < Test::Unit::TestCase

  def test_tablero_vacio
  	tablero = Tablero.new

    assert_equal true, tablero.vacio?
  end

  def test_pongo_algo_no_esta_vacio
 	tablero = Tablero.new
	tablero.insertar("x",2,2)
	assert_equal false, tablero.vacio?  	
  end

  def test_pongo_algo_y_veo_la_posicion
 	tablero = Tablero.new
	tablero.insertar("x",2,2)
	assert_equal false, tablero.vacio?  	
  end
end

class Tablero
	
	def initialize
		@@vacio = true
	end

	def vacio?
		@@vacio
	end

	def insertar(ficha, pos_x, pos_y)
		@@vacio = false
	end
end
