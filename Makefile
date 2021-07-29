
.DEFAULT_GOAL := setup

#
setup:
#	brew bundle && brew bundle
	brew bundle
	make git_setup
	make resources
	
#
resources:
	mkdir -p "CodeHub/Resources/Generated"
	swiftgen config run --config swiftgen.yml
	fastlane add_plugin firebase_app_distribution
	
#
format:
	swiftformat .
	swiftlint autocorrect

#
git_setup:
	eval "$$add_pre_commit_script"

# Define pre commit script to auto lint and format the code
define _add_pre_commit
SWIFTLINT_PATH=`which swiftlint`
SWIFTFORMAT_PATH=`which swiftformat`
if [ -d ".git" ]; then
cat > .git/hooks/pre-commit << ENDOFFILE
#!/bin/sh
FILES=\$(git diff --cached --name-only --diff-filter=ACMR "*.swift" | sed 's| |\\ |g')
[ -z "\$FILES" ] && exit 0
# Format
${SWIFTFORMAT_PATH} \$FILES

# Lint
${SWIFTLINT_PATH} autocorrect \$FILES
${SWIFTLINT_PATH} lint \$FILES
# Add back the formatted/linted files to staging
echo "\$FILES" | xargs git add

exit 0
ENDOFFILE

chmod +x .git/hooks/pre-commit
fi
endef
export add_pre_commit_script = $(value _add_pre_commit)
