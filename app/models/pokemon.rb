class Pokemon < ApplicationRecord
  attribute :access, :string
  attribute :sub_access, :string
  #attribute :sub_accessx, :string
  #enum sub_access: {}, _suffix: true
  
  enum access: {
    draft: 'draft',
    published: 'published',
    passcode_protected: 'passcode_protected',
    poke: 'poke'
  }

  enum sub_access: {
    bulbasaur: 'bulbasaur'
  }, _suffix: true

  # if params[:fetchpokemon]
  #   def self.define_pokemon_enum(names)
  #     enum sub_accessx: names.map { |name| [name.to_sym, name] }.to_h, _suffix: true
  #   end
  # end

end



