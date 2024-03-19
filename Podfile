platform :ios, '17.0'

flutter_application_path = '../flutter_ink_super_app'

load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'iosapp' do
    install_all_flutter_pods(flutter_application_path)
end

post_install do |installer|
  flutter_post_install(installer) if defined?(flutter_post_install)
end