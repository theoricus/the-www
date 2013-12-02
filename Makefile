THE=node_modules/theoricus/theoricus

dev:
	@$(THE) -s

release:
	@$(THE) -r

release.preview:
	@$(THE) -rs