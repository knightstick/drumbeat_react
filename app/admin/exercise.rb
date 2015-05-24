ActiveAdmin.register Exercise do
  permit_params \
    :name,
    :image_url,
    :description
end
