#!/bin/sh

echo $$
# Check enviroment variable VENV_PATH (optional)
if [ -z "$VENV_PATH" ]; then
    echo "variable VENV_PATH is not set.
A path where all your virtual enviroments are located.
For example, $HOME/venv
Add this code to your profile (.bashprofle, .zprofile):

export VENV_PATH='$HOME/venv'

"
fi

# Check enviroment variable CODE_PATH
if [ -z "$CODE_PATH" ]; then
    echo "variable CODE_PATH is not set.
A path where all your python projects are located.
For example, $HOME/code
Virtualenv name will be same as project name.
Add this code to your profile (.bashprofle, .zprofile):

export CODE_PATH='$HOME/code'

"
fi

# Check if called with arguments
if [ "$#" = "0" ]; then
    echo "usage: . workon.sh [project name]"
    return
fi

# Check if project exists & cd
PROJECT_PATH="$CODE_PATH/$1"
if [ ! -d "$PROJECT_PATH" ]; then
    echo "$1 not found, stopping"
    return
else
    cd "$PROJECT_PATH" || exit 1
fi

# Try to find project root and set PYTHONPATH
if [ -d "$PROJECT_PATH/$1" ]; then
    export PYTHONPATH="$PROJECT_PATH/$1"
elif [ -d "$PROJECT_PATH/src" ]; then
    export PYTHONPATH="$PROJECT_PATH/src"
else
    export PYTHONPATH="$PROJECT_PATH"
fi

# Find venv and activate it
PROJECT_VENV_PATH="$VENV_PATH/$1"
if [ -d "$PROJECT_PATH/venv" ]; then
    . "$PROJECT_PATH/venv/bin/activate"
elif [ -d "$PROJECT_VENV_PATH" ]; then
    . "$PROJECT_VENV_PATH/bin/activate"
else
    echo "$1 venv not found. Create it:\nrebuild $1\n "
fi
