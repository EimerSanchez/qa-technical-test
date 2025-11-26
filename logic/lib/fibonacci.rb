# Clase para generar la secuencia de Fibonacci
class Fibonacci
  # Genera la secuencia de Fibonacci hasta el n-ésimo término.
  # @param n [Integer] El número de términos a generar.
  # @return [Array<Integer>] Un array con la secuencia de Fibonacci.
  def self.sequence(n)
    # Casos base
    return [] if n <= 0
    return [0] if n == 1

    # Inicializamos la secuencia con los dos primeros términos.
    sequence = [0, 1]

    # Generamos los términos restantes hasta n.
    (n - 2).times do
      next_term = sequence[-1] + sequence[-2]
      sequence << next_term
    end

    sequence
  end
end 
