# Clase para determinar si un número es primo
class PrimeNumber
  # Verifica si un número es primo.
  # Un número primo es un número natural mayor que 1 que no tiene divisores positivos más que 1 y él mismo.
  # @param number [Integer] El número a verificar.
  # @return [Boolean] True si el número es primo, false en caso contrario.
  def self.is_prime?(number)
    # Los números primos deben ser mayores que 1.
    return false if number <= 1

    # 2 es el único número primo par.
    return true if number == 2

    # Todos los demás números pares no son primos.
    return false if number.even?

    # Verificamos divisores impares desde 3 hasta la raíz cuadrada del número.
    # No es necesario verificar más allá de la raíz cuadrada.
    i = 3
    while i * i <= number
      return false if number % i == 0
      i += 2 # Solo necesitamos verificar divisores impares.
    end

    # Si no se encontraron divisores, el número es primo.
    true
  end
end
