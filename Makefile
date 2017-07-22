install: links.create deps.init deps.bundle clean

links.create:
	sh scripts/links-create

deps.init:
	sh scripts/install-brew

deps.bundle:
	brew bundle

clean:
	brew cleanup
	brew cask cleanup

