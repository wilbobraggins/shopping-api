class ProductSerializer 
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :item, :description, :price
end
