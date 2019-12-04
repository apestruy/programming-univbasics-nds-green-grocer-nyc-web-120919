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
 output = {}
  cart.each do |item|
    item_name = item.keys[0]
    if output[item_name]
      output[item_name][:count] += 1 
    else
      output[item_name] = item[item_name]
      output[item_name][:count] = 1 
    end
  end
  output 
  end

def apply_coupons(cart, coupons)
 
  coupons.each do |coupon| 
    coupon.each do |attribute, value| 
      name = coupon[:item] 
    
      if cart[name] && cart[name][:count] >= coupon[:num] 
        if cart["#{name} W/COUPON"] 
          cart["#{name} W/COUPON"][:count] += 1 
        else 
          cart["#{name} W/COUPON"] = {:price => coupon[:cost], 
          :clearance => cart[name][:clearance], :count => 1} 
        end 
  
      cart[name][:count] -= coupon[:num] 
    end 
  end 
end 
  cart
end

def apply_clearance(cart)
  cart.each do |item, attribute_hash| 
    if attribute_hash[:clearance] == true 
      attribute_hash[:price] = (attribute_hash[:price] *
      0.8).round(2) 
    end 
  end 
cart 
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
