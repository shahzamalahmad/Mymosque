ActiveAdmin.register Home do
  permit_params :category, :address, :full_name, :manager, :imam, :contact_no, :email, :whatsapp


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
    end
  end
end