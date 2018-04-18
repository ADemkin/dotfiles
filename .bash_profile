# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

function pkit(){
	cd /Volumes/Atlas/code/pkit/
	. ../../venv/pkit/bin/activate
	export PYTHONPATH=src:$PYTHONPATH
}

function pypki(){
	cd /Volumes/Atlas/code/pypki/
	. ../../venv/pypki/bin/activate
	export PYTHONPATH=src:$PYTHONPATH
}


function pypki2(){
	cd /Volumes/Atlas/code/pypki/
	. ../../venv/pypki2.7/bin/activate
	export PYTHONPATH=src:$PYTHONPATH
}
