source 'https://github.com/CocoaPods/Specs'

platform :ios, '8.0'

# Add Application pods here
use_frameworks!

target 'SamsaoTest' do
	pod 'SteviaLayout'
	pod 'IQKeyboardManagerSwift'
end

# Copy acknowledgements to the Settings.bundle

post_install do | installer |
  require 'fileutils'

  pods_acknowledgements_path = 'Pods/Target Support Files/Pods/Pods-Acknowledgements.plist'
  settings_bundle_path = Dir.glob("**/*Settings.bundle*").first

  if File.file?(pods_acknowledgements_path)
    puts 'Copying acknowledgements to Settings.bundle'
    FileUtils.cp_r(pods_acknowledgements_path, "#{settings_bundle_path}/Acknowledgements.plist", :remove_destination => true)
  end
end
