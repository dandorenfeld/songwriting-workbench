require 'yaml'
config = YAML::load_file("#{Rails.root}/config/smtp.yaml")
Pony.options = {
  :from => config['email'],
  :via  => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => config['email'],
    :password             => config['password'],
    :authentication       => :plain,
    :domain               => "HELO",
  },
}
