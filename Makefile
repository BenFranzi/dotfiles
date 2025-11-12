SOURCE_DIR 		= $(shell pwd)
DESTINATION_DIR = ${HOME}
ASSETS 			= \
	.zshrc \
	.oh-my-zsh/custom/aliases.zsh \
	.oh-my-zsh/custom/commands.zsh \
	.oh-my-zsh/custom/palette.zsh \
	.config/nvim \
	.config/alacritty \
	.gitignore \
	.tmux.conf \
	.ideavimrc

create_links:
	@echo "➕ Creating dotfile symlinks: (${DESTINATION_DIR})"
	@for item in $(ASSETS); do \
		if [ -h ${DESTINATION_DIR}/$$item ]; then \
			echo "    - skip, already linked \t $$item"; \
		elif [ -f ${DESTINATION_DIR}/$$item ]; then \
			echo "    - skip, existing file \t $$item"; \
		elif [ -d ${DESTINATION_DIR}/$$item ]; then \
			echo "    - skip, existing directory \t $$item"; \
		elif [ -e ${DESTINATION_DIR}/$$item ]; then \
			echo "    - skip, something else \t $$item"; \
		else \
			ln -s ${SOURCE_DIR}/$$item ${DESTINATION_DIR}/$$item; \
			echo "    - linked \t\t\t $$item"; \
		fi \
	done
	@echo "✅ Symlinks creation complete."


clean:
	@echo "➖ Removing dotfile symlinks: (${DESTINATION_DIR})"
	@for item in $(ASSETS); do \
		if [ -h ${DESTINATION_DIR}/$$item ]; then \
			echo "    - removed link \t\t $$item"; \
			rm -f ${DESTINATION_DIR}/$$item; \
		elif [ -f ${DESTINATION_DIR}/$$item ]; then \
			echo "    - skip, existing file \t $$item"; \
		elif [ -d ${DESTINATION_DIR}/$$item ]; then \
			echo "    - skip, directory \t\t $$item"; \
		elif [ -e ${DESTINATION_DIR}/$$item ]; then \
			echo "    - skip, something else \t\t $$item"; \
		else \
			echo "    - skip, not found \t\t $$item"; \
		fi \
	done
	@echo "🗑️ Symlinks removal complete."

.DEFAULT_GOAL := create_links
