class Pokemon < ApplicationRecord
  attribute :access, :string
  attribute :sub_access, :string
  
  enum access: {
    draft: 'draft',
    published: 'published',
    passcode_protected: 'passcode_protected',
    poke: 'poke'
  }

  enum sub_access: {
    bulbasaur: 'bulbasaur',
    venusaur: 'venusaur'
  }, _suffix: true
end
