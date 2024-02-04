.PHONY: build

build:
	sam build

deploy-infra:
	sam build && aws-vault exec millerws --no-session -- sam deploy

deploy-site:
	aws-vault exec millerws --no-session -- aws s3 sync ./website-files s3://website.sebiproj.com

invoke-put:
	sam build && aws-vault exec millerws --no-session -- sam local invoke PutFunction

invoke-get:
	sam build && aws-vault exec millerws --no-session -- sam local invoke GetFunction

git-push:
	git push https://github.com/sebster2/cloud-resume-challenge master