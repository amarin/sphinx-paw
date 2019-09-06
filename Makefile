PROJECT_KEY		= sphinx_configurator
SOURCEDIR     	= ./src/${PROJECT_KEY}
MSG_CATALOG		= ./src/locale/
MSG_TEMPLATE	= ${MSG_CATALOG}${PROJECT_KEY}.pot


help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  locale-extract   		to extract localized strings from source code"
	@echo "  locale-update    		to update existed locales to have all localized strings"
	@echo "  locale-add <locale>    to add additional locale"

locale-extract:
	@echo
	@echo "Extracting localization strings from $(SOURCEDIR)"
	pybabel extract --output=${MSG_TEMPLATE} ${SOURCEDIR}/
	@echo
	@echo "Done"

locale-update:
	@echo
	@echo "Extracting localization strings from $(SOURCEDIR)"
	pybabel update --input-file=${MSG_TEMPLATE} --domain=${PROJECT_KEY} --output-dir=${MSG_CATALOG}
	@echo
	@echo "Done"

locale-add:
	@echo
	@echo "Extracting localization strings from $(SOURCEDIR)"
	pybabel init --input-file=${MSG_TEMPLATE} --domain=${PROJECT_KEY} --output-dir=${MSG_CATALOG} --locale=$(locale)
	@echo
	@echo "Done"

locale-compile:
	@echo
	@echo "Compile localization strings *.mo files"
	pybabel compile --directory=${MSG_CATALOG} --domain=${PROJECT_KEY}