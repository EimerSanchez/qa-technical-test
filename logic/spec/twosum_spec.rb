require 'spec_helper'

describe TwoSum do
  describe '.find_indices' do
    context 'cuando existe una solución' do
      it 'devuelve los índices correctos para un array simple' do
        nums = [2, 7, 11, 15]
        target = 9
        expect(TwoSum.find_indices(nums, target)).to eq([0, 1])
      end

      it 'devuelve los índices correctos para un array con números desordenados' do
        nums = [3, 2, 4]
        target = 6
        expect(TwoSum.find_indices(nums, target)).to eq([1, 2])
      end

      it 'devuelve los índices correctos con números negativos' do
        nums = [-1, -3, 5, 90]
        target = 4
        expect(TwoSum.find_indices(nums, target)).to eq([0, 2])
      end
    end

    context 'cuando no existe una solución' do
      it 'devuelve nil' do
        nums = [2, 7, 11, 15]
        target = 3
        expect(TwoSum.find_indices(nums, target)).to be_nil
      end
    end

    context 'con casos borde' do
      it 'devuelve nil para un array vacío' do
        expect(TwoSum.find_indices([], 5)).to be_nil
      end
    end
  end
end
