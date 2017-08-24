Pod::Spec.new do |s|
    s.name                      = "MatrixUtils"
    s.version                   = "1.0.0"
    s.summary                   = "MATRIX Utils for Swift."
    s.homepage                  = "https://github.com/matrix-io/matrix-utils-swift"
    s.license                   = { :type => "MIT", :file => "LICENSE.txt" }
    s.author                    = "MATRIX Labs"
    s.social_media_url          = "https://twitter.com/MATRIX_Creator"
    s.ios.deployment_target     = "8.0"
    s.osx.deployment_target     = "10.10"
    s.watchos.deployment_target = '2.0'
    s.tvos.deployment_target    = '9.0'
    s.source                    = { :git => "#{s.homepage}.git", :tag => "v#{s.version}" }
    s.source_files              = "Sources/**/*.swift"
end
