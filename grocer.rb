def find_item_by_name_in_collection(name, collection)
  hash = {}
  index = 0 
  while index < collection.length do 
    if name == collection[index][:item]
      hash = collection[index]
      return hash
    end 
     index += 1 
    end 
  if hash = {}
    return nil 
  else 
    return hash 
  end 
end

def consolidate_cart(cart)
 final_array = []
 hash = {}
 items_array = []
 index = 0 
 while index < cart.length do 
   item = cart[index][:item]
   hash = cart[index]
   if hash[item]
     hash[item][:count] += 1 
   else 
     hash[item] = cart[index]
     hash[item][:count] = 1 
     items_array << item 
   end 
   index += 1 
 end
 
 index = 0 
 while index < items_array.length do 
   
   final_array << hash[items_array[index]]
   index += 1 
 end
 final_array
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
