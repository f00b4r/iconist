ifdef DEV
	NPM_DRY=--dry
endif

rename-lower:
	mv -i ${FILE} ${FILE}-tmp
	mv -i ${FILE}-tmp $(shell echo $(FILE) | tr A-Z a-z)

##################################################
# TWEMOJI ########################################
##################################################

twemoji-build:
	git clone --depth 1 https://github.com/twitter/twemoji.git tmp/twemoji || true
	mkdir -p packages/twemoji/dist
	cp -R tmp/twemoji/assets/svg/ packages/twemoji/dist

twemoji-publish:
	cd packages/twemoji && \
	npm publish --access public --tag latest ${NPM_DRY}

##################################################
# NOTOEMOJI ######################################
##################################################

notoemoji-build:
	git clone --depth 1 https://github.com/googlefonts/noto-emoji tmp/notoemoji || true
	mkdir -p packages/notoemoji/dist
	cp -R tmp/notoemoji/svg/ packages/notoemoji/dist

notoemoji-publish:
	cd packages/notoemoji && \
	npm publish --access public --tag latest ${NPM_DRY}

##################################################
# EMOJITWO #######################################
##################################################

emojitwo-build:
	git clone --depth 1 https://github.com/EmojiTwo/emojitwo.git tmp/emojitwo || true
	mkdir -p packages/emojitwo/dist
	cp -R tmp/emojitwo/svg/ packages/emojitwo/dist

emojitwo-publish:
	cd packages/emojitwo && \
	npm publish --access public --tag latest ${NPM_DRY}

##################################################
# FONTAWESOME ####################################
##################################################

fontawesome-build:
	git clone --depth 1 https://github.com/FortAwesome/Font-Awesome.git tmp/fontawesome || true
	mkdir -p packages/fontawesome/dist
	cp -R tmp/fontawesome/svgs/ packages/fontawesome/dist

fontawesome-publish:
	cd packages/fontawesome && \
	npm publish --access public --tag latest ${NPM_DRY}

##################################################
# HEROICONS ######################################
##################################################

heroicons-build:
	git clone --depth 1 https://github.com/refactoringui/heroicons.git tmp/heroicons || true
	mkdir -p packages/heroicons/dist
	cp -R tmp/heroicons/src/ packages/heroicons/dist

heroicons-publish:
	cd packages/heroicons && \
	npm publish --access public --tag latest ${NPM_DRY}

##################################################
# OPENMOJI #######################################
##################################################

openmoji-build:
	git clone --depth 1 https://github.com/hfg-gmuend/openmoji.git tmp/openmoji || true
	mkdir -p packages/openmoji/dist
	cp -R tmp/openmoji/color/svg/ packages/openmoji/dist/color
	cp -R tmp/openmoji/black/svg/ packages/openmoji/dist/black

openmoji-publish:
	cd packages/openmoji && \
	npm publish --access public --tag latest ${NPM_DRY}

##################################################
# DRIPICONS ######################################
##################################################

dripicons-build:
	git clone --depth 1 https://github.com/amitjakhu/dripicons.git tmp/dripicons || true
	mkdir -p packages/dripicons/dist || true
	cp -R tmp/dripicons/SVG/ packages/dripicons/dist

dripicons-publish:
	cd packages/dripicons && \
	npm publish --access public --tag latest ${NPM_DRY}

##################################################
# REMIXICON ######################################
##################################################

remixicon-build:
	git clone --depth 1 https://github.com/Remix-Design/RemixIcon.git tmp/remixicon || true
	mkdir -p packages/remixicon/dist || true
	cp -R tmp/remixicon/icons/ packages/remixicon/dist
	@for file in $(shell ls -d packages/remixicon/dist/*); do \
		FILE=$$file $(MAKE) rename-lower; \
	done

remixicon-publish:
	cd packages/remixicon && \
	npm publish --access public --tag latest ${NPM_DRY}

##################################################
# LINEARICONS ####################################
##################################################

linearicons-build:
	git clone --depth 1 https://github.com/cjpatoilo/linearicons.git tmp/linearicons || true
	mkdir -p packages/linearicons/dist || true
	cp -R tmp/linearicons/dist/svg/ packages/linearicons/dist

linearicons-publish:
	cd packages/linearicons && \
	npm publish --access public --tag latest ${NPM_DRY}

##################################################
# LINEAWESOME ####################################
##################################################

lineawesome-build:
	git clone --depth 1 https://github.com/icons8/line-awesome.git tmp/lineawesome || true
	mkdir -p packages/lineawesome/dist || true
	cp -R tmp/lineawesome/svg/ packages/lineawesome/dist

lineawesome-publish:
	cd packages/lineawesome && \
	npm publish --access public --tag latest ${NPM_DRY}

##################################################
# FEATHERICONS ###################################
##################################################

feathericons-build:
	git clone --depth 1 https://github.com/feathericons/feather.git tmp/feathericons || true
	mkdir -p packages/feathericons/dist || true
	cp -R tmp/feathericons/icons/ packages/feathericons/dist

feathericons-publish:
	cd packages/feathericons && \
	npm publish --access public --tag latest ${NPM_DRY}

##################################################
# IKONATE ########################################
##################################################

ikonate-build:
	git clone --depth 1 https://github.com/mikolajdobrucki/ikonate.git tmp/ikonate || true
	mkdir -p packages/ikonate/dist || true
	cp -R tmp/ikonate/icons/ packages/ikonate/dist

ikonate-publish:
	cd packages/ikonate && \
	npm publish --access public --tag latest ${NPM_DRY}
