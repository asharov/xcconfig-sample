platform :ios, '10.0'
use_frameworks!

target 'xcconfig-sample' do

  # Pods for xcconfig-sample
  pod 'SnapKit', '~> 3.2'

end

post_install do |installer_representation|
  work_dir = Dir.pwd
  Dir.glob("Pods/Target Support Files/Pods-xcconfig-sample/*.xcconfig") do |xc_config_filename|
    full_path_name = "#{work_dir}/#{xc_config_filename}"
    xc_config = File.read(full_path_name)
    new_xc_config = xc_config.sub(/FRAMEWORK_SEARCH_PATHS/, 'PODS_FRAMEWORK_SEARCH_PATHS')
    new_xc_config = new_xc_config.sub(/HEADER_SEARCH_PATHS/, 'PODS_HEADER_SEARCH_PATHS')
    new_xc_config = new_xc_config.sub(/LIBRARY_SEARCH_PATHS/, 'PODS_LIBRARY_SEARCH_PATHS')
    new_xc_config = new_xc_config.sub(/OTHER_LDFLAGS/, 'PODS_OTHER_LDFLAGS')
    new_xc_config = new_xc_config.sub(/OTHER_CFLAGS/, 'PODS_OTHER_CFLAGS')
    new_xc_config = new_xc_config.sub(/GCC_PREPROCESSOR_DEFINITIONS/, 'PODS_GCC_PREPROCESSOR_DEFINITIONS')
    new_xc_config = new_xc_config.sub(/OTHER_SWIFT_FLAGS/, 'PODS_OTHER_SWIFT_FLAGS')
    File.open(full_path_name, 'w') { |file| file << new_xc_config }
  end
end
