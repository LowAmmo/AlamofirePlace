ios_deployment_target = 15.5

platform :ios, ios_deployment_target

# Fixes issue where Pod doesn't pick up changes in dependencies
# https://github.com/CocoaPods/CocoaPods/issues/8073
# https://www.ralfebert.de/ios/blog/cocoapods-clean-input-output-files/
install! 'cocoapods', :disable_input_output_paths => true


target 'AlamofirePlaceLib' do
    use_frameworks!

    # Build Time Dependencies
    pod 'SwiftLint', '>= 0.51'

    pod 'AlamofirePlace', :path => './'


    target 'AlamofirePlaceTests'

end

# Disable signing when just building/testing this library
post_install do |installer|
    installer.pods_project.targets.each do |target|

        target.build_settings('Debug')["OTHER_LDFLAGS[sdk=iphonesimulator*]"] = "$(inherited) -framework XCTest"

        target.build_configurations.each do |config|
            config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
            config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
            config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"

            # Setting this seems to clear out warnings about updating the Pod project & helps clean up warnings about dependencies targeting
            #   extremely old iOS versions (i.e. 8.0, 9.0, etc.).
            if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < ios_deployment_target
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = ios_deployment_target
            end
        end
    end
end
