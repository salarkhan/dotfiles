#running webrick for face-off
ruby -r webrick -e "s=WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd); trap('INT'){s.shutdown};s.start"

#Show hidden files:
`defaults write com.apple.finder AppleShowAllFiles -boolean true`
`killall Finder`

#The reverse is
`defaults delete com.apple.finder AppleShowAllFiles`
`killall Finder`
