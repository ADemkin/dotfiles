#!/bin/sh -e

if [ -z "$VENV_PATH" ]; then
    echo "variable VENV_PATH is not set.
A path where all your virtual enviroments are located.
For example, $HOME/venv
Add this code to your profile (.bashprofle, .zprofile):

export VENV_PATH='$HOME/venv'

"
    exit 1
fi

# Check project path
if [ -z "$CODE_PATH" ]; then
    echo "variable CODE_PATH is not set.
A path where all your python projects are located.
For example, $HOME/code
Virtualenv name will be same as project name.
Add this code to your profile (.bashprofle, .zprofile):

export CODE_PATH='$HOME/code'

"
    exit 1
fi

# Check if called with arguments
if [ "$#" = "0" ]; then
    echo "usage: rebuild [project name] [optional venv python]

If no second argument given, then 'python3' will be used by default
"
    exit 1
fi

# Check that project exists
PROJECT_PATH="$CODE_PATH/$1"
if [ ! -d "$PROJECT_PATH" ]; then
    echo "$1 not found, stopping"
    exit 1
fi

# Remove exisiting venv if exists
PROJECT_VENV_PATH="$VENV_PATH/$1"
if [ -d "$PROJECT_VENV_PATH" ]; then
    rm -rf "$PROJECT_VENV_PATH"
fi

# Get python
if [ -z "$2" ]; then
    PYTHON=python3
else
    PYTHON="$2"
fi
echo "Using python: $PYTHON"

# Create virtualenv
virtualenv --python="$PYTHON" "$PROJECT_VENV_PATH"
. "$PROJECT_VENV_PATH/bin/activate"
# cp $HOME/.pip.conf $PROJECT_VENV_PATH/pip.conf  # TODO: echo "" >> $PROJECT_VENV_PATH/pip.conf
pip --disable-pip-version-check install pip==9.0.3 gnureadline flake8
find "$PROJECT_PATH" -name "requirements*.txt" -type f -maxdepth 1 -exec pip --disable-pip-version-check install -r "{}" ";"
cd "$PROJECT_PATH"

echo "Rebuilding virtialenv for $1 done"
