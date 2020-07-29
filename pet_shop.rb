def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  return pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_of_additional_pets_sold)
  return pet_shop[:admin][:pets_sold] += number_of_additional_pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed (pet_shop, breed)
  pets = []
    for pet in pet_shop[:pets]
      if pet[:breed] == breed
      pets.push(pet)
    end
  end
  return pets
end

def find_pet_by_name(pet_shop, pet_name)
  pet_found = nil
  for pet in pet_shop[:pets]
    pet_found = pet if(pet[:name] == pet_name)
  end
    return pet_found
end

def remove_pet_by_name(pet_shop, pet_name)
    for pet in pet_shop[:pets]
      if pet[:name] == pet_name
      pet_shop[:pets].delete(pet)
      end
    end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

# method just focusing on one customer, don't have to send the whole collection, as will only be looking at the one specified

def remove_customer_cash(customer, cash_to_remove)
  return customer[:cash] -= cash_to_remove
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  return customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  return customer[:cash] >= new_pet[:price]
end
# will be inherently true/false

def sell_pet_to_customer (pet_shop, pet, customer)
  return if (pet ==nil)
  return if !(customer_can_afford_pet(customer, pet))

  add_pet_to_customer(customer, pet)
  increase_pets_sold(pet_shop, 1)
  remove_customer_cash(customer, pet[:price])
  add_or_remove_cash(pet_shop, pet[:price])
  remove_pet_by_name(pet_shop, pet[:name])
end
