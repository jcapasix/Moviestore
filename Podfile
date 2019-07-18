# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

workspace 'Moviestore'

def shared_pods
    pod 'ObjectMapper', '~> 3.0'
    pod 'AlamofireObjectMapper', '~> 5.0'
    pod 'AlamofireImage', '~> 3.5'
#    pod 'Alamofire-Synchronous', '~> 4.0'
    pod 'Alamofire', '~> 4.4'
    pod 'ReachabilitySwift', '~> 3.0'
    pod 'Mocker', '~> 1.0.0'
end

target 'Moviestore' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
end

target 'Presentation' do
    
    shared_pods
    
#    target 'PresentationTests' do
#        inherit! :search_paths
#        # Pods for testing
#    end
#
#    target 'PresentationUITests' do
#        inherit! :search_paths
#        # Pods for testing
#    end

    xcodeproj 'Presentation/Presentation.xcodeproj'

end

target 'Domain' do
#  pod 'ReachabilitySwift', '~> 3.0'
shared_pods
  xcodeproj 'Domain/Domain.xcodeproj'
#  target 'LocalTests' do
#    inherit! :search_paths
#  end
end

target 'Data' do
  shared_pods
#  use_modular_headers!
#  pod 'RealmSwift', :modular_headers => false

  xcodeproj 'Data/Data.xcodeproj'
  #  target 'LocalTests' do
  #    inherit! :search_paths
  #  end
end


require 'xcodeproj'

project_path = "Moviestore.xcodeproj"
project = Xcodeproj::Project.open(project_path)
project.targets.each do |target|
    puts target.name
    if target.name.include?("Extension")
        phase = target.shell_script_build_phases.find { |bp| bp.name == '[CP] Embed Pods Frameworks' }
        if !phase.nil?
            puts "Deleting Embed Pods Frameworks phase from #{target.name}…"
            target.build_phases.delete(phase)
        end
    end
end

project.save

