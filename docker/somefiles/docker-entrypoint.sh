#!/bin/bash

set +e

GREEN="\e[1;32m"
BULE="\e[1;34m"
RESET="\e[0m"

WORK_DIR="/app/LittlePaimon"

if [[ ! -d "$HOME/._ok" ]]; then
	mkdir ~/._ok
fi

if [ -d "${WORK_DIR}/.git" ]; then
	echo -e "\n ${BULE}----------------拉取LittlePaimon更新----------------${RESET} \n"

	if [[ -n $(git status -s) ]]; then
		echo -e "\n ${BULE}----------------当前工作区有修改，尝试暂存后更新----------------${RESET} \n"
		git add .
		git stash
		git pull origin Bot --allow-unrelated-histories --rebase
		git stash pop
	else
		git pull origin Bot --allow-unrelated-histories
	fi

	if [[ ! -f "${HOME}/._ok/lp.ok" ]]; then
		set -e
		echo -e "\n ${BULE}----------------首次运行确保依赖安装完成----------------${RESET} \n"
		poetry install
                poetry run nb plugin install nonebot-plugin-gocqhttp
                #poetry run nb plugin install nonebot_plugin_apscheduler #偶有缺失，确保安装
		touch ~/._ok/lp.ok
		set +e
	fi

	echo -e "\n ${GREEN}----------------更新LittlePaimen完成----------------${RESET} \n"
	git log -1 --pretty=format:"%h - %an, %ar (%cd) : %s"
fi

cd $WORK_DIR

poetry run nb run
