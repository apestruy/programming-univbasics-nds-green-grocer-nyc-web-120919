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
con_cart = []
  index = 0
  temp_cart = {}
  names_list = []
  while index < cart.length do 
    name = cart[index][:item]
    hash = cart[index]
    if !temp_cart[name]
      temp_cart[name] = hash
      temp_cart[name][:count] = 1 
      names_list << name
    else
      temp_cart[name][:count] += 1
    end
    index += 1 
  end
  
  index = 0 
  while index < names_list.length do
    con_cart_item = temp_cart[names_list[index]]
    con_cart << con_cart_item
    index += 1 
  end
  con_cart
end 

def apply_coupons(cart, coupons)
 new_array = []
  for item in cart do
    coupon = get_coupon(item, coupons)
    if coupon
      discounted_price = coupon[:cost] / coupon[:num]
      discounted_item = {:item => item[:item] + " W/COUPON", :price => discounted_price,
        :clearance => item[:clearance], :count => coupon[:num]}
      new_array.push(discounted_item)
      no_sale_item = {:item => item[:item],:price => item[:price], :clearance => item[:clearance], :count => item[:count] - coupon[:num]}
        new_array.push(no_sale_item)
    else
      new_array.push(item)
    end
  end
  new_array
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
