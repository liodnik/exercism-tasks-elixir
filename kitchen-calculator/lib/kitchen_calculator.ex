defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    ml =
      case elem(volume_pair, 0) do
        :cup -> get_volume(volume_pair) * 240
        :fluid_ounce -> get_volume(volume_pair) * 30
        :teaspoon -> get_volume(volume_pair) * 5
        :tablespoon -> get_volume(volume_pair) * 15
        _ -> get_volume(volume_pair) * 1
      end

    {:milliliter, ml}
  end

  def from_milliliter(volume_pair, unit) do
    val =
      case unit do
        :cup -> get_volume(volume_pair) / 240
        :fluid_ounce -> get_volume(volume_pair) / 30
        :teaspoon -> get_volume(volume_pair) / 5
        :tablespoon -> get_volume(volume_pair) / 15
        _ -> get_volume(volume_pair)
      end

    {unit, val}
  end

  def convert(volume_pair, new_unit) do
    val = from_milliliter(to_milliliter(volume_pair), new_unit)

    {new_unit, elem(val, 1)}
  end
end
