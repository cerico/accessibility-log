entries:
	ansible-playbook entries.yml
entry:
	ansible-playbook entry.yml
	@echo Please edit: `ls -d _imports/posts`/`ls -tr _imports/posts | tail -1` 
	@ansible-playbook entries.yml > /dev/null
publish:
	npm run build
	ansible-playbook deploy/publish.yml
repo:
	git init
	git add .
	git commit -m "init"
	git branch -m main
	gh repo create a11y --public -y
	gh secret set DEPLOY_KEY < ~/.ssh/cheboksaru/deploy_rsa
	git push origin main
