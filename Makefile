entries:
	ansible-playbook entries.yml
post:
	node post.js
	make entries
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
