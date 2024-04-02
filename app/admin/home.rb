ActiveAdmin.register Home do
  permit_params :category, :address, :full_name, :manager, :imam, :contact_no, :email, :whatsapp, :is_approved, :latitude, :longitude

# filter :is_approved
# filter :full_name, as: :select, collection: -> { Home.pluck(:full_name) }
# filter :address
location = Location.new(latitude: 37.7749, longitude: -122.4194)

  index do
    selectable_column
    id_column
    column :full_name do |home|
      home.full_name.humanize
    end
    column :address do |home|
      home.address
      # home.address.humanize
    end
    column :near_by_address do |home|
      location = Location.new(latitude: home.latitude.to_f, longitude: home.longitude.to_f)
      location.reverse_geocode
      # home.address.humanize
    end
    column :category do |home|
      home.category.humanize
    end
    column :manager do |home|
      home.manager.humanize
    end
    column :imam do |home|
      home.imam.humanize
    end
    column :contact_no
    column :email
    column :whatsapp
    column :is_approved
    column :latitude
    column :longitude
    actions
  end


  form do |f|
    f.inputs 'Mosque Details' do
      f.input :category, input_html: { multiple: false }, collection: Category.all.map { |c| [c.name] }, prompt: 'Select Category'
      f.input :address, as: :string, input_html: {class: 'map-input'}
      f.input :latitude
      f.input :longitude
      f.input :full_name
      f.input :manager
      f.input :imam
      f.input :contact_no
      f.input :email
      f.input :whatsapp
      f.input :is_approved
    end
    f.actions
  end

  # Add JavaScript for the map input field
  #   content_for :javascript do
  #   javascript_tag <<~JS
  #     $(document).ready(function() {
  #       $('.map-input').geocomplete();
  #     });
  #   JS
  # end

  show do
    attributes_table do
      row :category do |home|
        home.category.humanize
      end
      row :address do |home|
        home.address.humanize
      end
      row :full_name do |home|
        home.full_name.humanize
      end
      row :manager do |home|
        home.manager.humanize
      end
      row :imam do |home|
        home.imam.humanize
      end
      row :is_approved
      row :latitude
      row :longitude
    end
  end
end