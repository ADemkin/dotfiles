# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
# Increase bash history size
HISTFILESIZE=10000000
HISTSIZE=10000000
export HISTFILESIZE
export HISTSIZE


function pkit(){
	cd ~/code/pkit/
	. ~/venv/pkit/bin/activate
	export PYTHONPATH=src:$PYTHONPATH
}

function pypki(){
	cd ~/code/pypki/
	. ~/venv/pypki/bin/activate
	export PYTHONPATH=src:$PYTHONPATH
}


function pypki2(){
	cd ~/code/pypki/
	. ~/venv/pypki2/bin/activate
	export PYTHONPATH=src:$PYTHONPATH
}


