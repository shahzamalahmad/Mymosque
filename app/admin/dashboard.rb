# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    div(class: "flex-container") do
      div(class: "left-div") do
        div class: "blank_slate_container" do
          columns do
            column do
              panel "Total mosques" do
                ul do
                  Home.where(category: "mosque").count
                end
              end
            end
          end
        end
      end

      div(class: "right-div") do
        div class: "blank_slate_container" do
          columns do
            column do
              panel "Total madarsa" do
                ul do
                  Home.where(category: "madarsa").count
                end
              end
            end
          end
        end
      end
    end

    div(class: "flex-container") do
      div(class: "left-div") do
        div class: "blank_slate_container" do
          columns do
            column do
              panel "Total Schools" do
                ul do
                  Home.where(category: "school").count
                end
              end
            end
          end
        end
      end

      div(class: "right-div") do
        div class: "blank_slate_container" do
          columns do
            column do
              panel "Other institutes" do
                ul do
                  # Home.where(category: "madarsa").count
                  "NA"
                end
              end
            end
          end
        end
      end
    end


    div class: "blank_slate_container" do
      columns do
        column do
          panel "Recent Mosques" do
            ul do
              Home.order(created_at: "desc").limit(5).map do |home|
                li link_to(home.full_name + " " + home.address, admin_home_path(home))
              end
            end
          end
        end
      end
    end
  end
end
