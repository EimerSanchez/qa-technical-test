# Clase para resolver el problema de Two Sum
class TwoSum
  # Encuentra los índices de dos números en un array que suman un objetivo específico.
  # @param nums [Array<Integer>] Un array de números.
  # @param target [Integer] El número objetivo de la suma.
  # @return [Array<Integer>, nil] Un array con los dos índices, o nil si no se encuentra una solución.
  def self.find_indices(nums, target)
    # Usamos un hash para almacenar los números que ya hemos visto y sus índices.
    num_indices = {}

    nums.each_with_index do |num, i|
      # Calculamos el complemento que necesitamos para alcanzar el objetivo.
      complement = target - num

      # Si el complemento ya está en nuestro hash, hemos encontrado la solución.
      if num_indices.key?(complement)
        return [num_indices[complement], i]
      end

      # Si no, guardamos el número actual y su índice en el hash.
      num_indices[num] = i
    end

    # Si recorremos todo el array y no encontramos una solución, devolvemos nil.
    nil
  end
end 
