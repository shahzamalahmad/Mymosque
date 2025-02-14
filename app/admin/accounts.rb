ActiveAdmin.register Account do
  permit_params :email, :role_id, :password, :password_confirmation, :approved

  index do
    selectable_column
    id_column
    column :email
    column :role_id, as: "Role" do |account|
      Role.find_by(id: account.role_id)&.name || "No Role"
    end
    column :approved
    column :created_at
    actions
  end

  filter :email
  filter :role_id
  filter :created_at
  filter :approved

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role_id, as: :select, collection: Role.all.map { |r| [r.name, r.id] }, prompt: "Select Role"
      f.input :approved, as: :boolean
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :role_id
      row :approved
      row :created_at
    end
  end
end
