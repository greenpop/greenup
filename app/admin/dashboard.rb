ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    link_to "To User List", :admin_users
    link_to "To Home Page", events_path
  end # content
      
  
end
