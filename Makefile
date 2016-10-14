NAME=ansible-all-the-things

_default:
	hovercraft presentation.rst out

clean:
	rm -rf out

git-clean:
	@git clean -d -q -x

