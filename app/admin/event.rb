ActiveAdmin.register Event do

  permit_params :name, :about, :start_date, :end_date, :background


  form do |f|
    f.inputs "Project Details" do
      f.input :name
      f.input :about
      f.input :start_date
      f.input :end_date
      f.input :background, :as => :file
      # Will preview the image when the object is edited
    end
    f.actions
   end

  show do |event|
    attributes_table do
      row :name
      row :about
      row :start_date
      row :end_date
      row :background do
        image_tag(event.background.url(:thumb))
      end
      # Will display the image on show object page
    end
   end

  index do |event|
      column :name
      column :about
      column :start_date
      column :end_date

      actions
    end


  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
