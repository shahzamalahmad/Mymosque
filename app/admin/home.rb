ActiveAdmin.register Home do

  permit_params :address, :latitude, :longitude, :body, :category, :contact_no, :created_at, :email, :first_name, :full_name, :id, :id_value, :imam, :last_name, :manager, :title, :updated_at, :whatsapp, :is_approved

  index do
    selectable_column
    id_column
    column :full_name do |home|
      home.full_name.humanize
    end
    column :address do |home|
      home.address.humanize
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
    actions
  end


  form do |f|
    f.inputs 'Mosque Details' do
      f.input :category, input_html: { multiple: false }, collection: Category.all.map { |c| [c.name] }, prompt: 'Select Category'
      f.input :address
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
    end
  end
end