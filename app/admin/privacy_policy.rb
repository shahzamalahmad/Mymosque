ActiveAdmin.register PrivacyPolicy do
  permit_params :title, :description

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :created_at
    actions
  end

  filter :title
  filter :description
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :description, as: :quill_editor
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :description
      row :created_at
    end
  end

end
